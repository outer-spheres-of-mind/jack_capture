#This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


echo "#include <sndfile.h>" >temp$$.c
echo "main(){return SF_FORMAT_OGG;}" >>temp$$.c
echo >>temp$$.c
if gcc temp$$.c 2>/dev/null; then
    echo "#define HAVE_OGG 1"
else
    echo "#define HAVE_OGG 0"
fi


echo "#include <lame/lame.h>" >temp$$.c
echo "main(){return 0;}" >>temp$$.c
echo >>temp$$.c
if gcc temp$$.c -lmp3lame 2>/dev/null; then
    echo "#define HAVE_LAME 1"
    echo "//COMPILEFLAGS -lmp3lame"
else
    echo "#define HAVE_LAME 0"
fi


rm temp$$.c
