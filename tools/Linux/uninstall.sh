#!/bin/bash
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Copyright (C) 2022-2023 Rangga Fajar Oktariansyah and Contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not write to the Rangga Fajar Oktariansyah, see <https://www.gnu.org/licenses/>.
skip=79
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
]   �������� �BF=�j�g�z�ᑪ�c���Y"�p���Je�C��Ų�� BNZ�)���)�#|s������d%�Ѳ����Y �_�5aK�1W`Dki�b�o��O/[�@8�1�3B�9&�GF̪�7C�c�T�"�{ 1D^����k�1ӹ�s8cg����C�Ӝ��"�3��N���O�b ��o�<��g��T!���0-e��n<�	��������X��%[5�ӊ7�� TAa����hGbR�X�k�>��g8يU��S��E�=�m�i�l~�i?�ȳ3���95C�<p�>��Հ��"��,/ss@�tM���
|}ḋ�����ƞ���L�p������q�<j��J ��;)1�	,�|.ט�= �x��a$Ɂ���\W�=��,W�(�����S�a����o}��xF�ֆ��6��OT�����wv�����AC������\I&��ݯ�����E���M�.iH8�%��IF3
��3��3?�z[z�6�2A��%�2*����%A�(OS��Y���= �+�E��N�{M����%6O���m�,[8�6}U����T6��"ݫVhrv����`̽@�"Yx0���x�Ǖ�:���u��	�n�:�����ኴX<#^��n���1��^K��[$#�9��X0ȫ��7����!�ٸ��e�c�R�RUp5zVUj�L�*�J�uq����QWniߢ��V�L���`//h�~~Л��C�W��!S7S�i<�Y��u�a-�P&磏[�G:�:{�?��P ��]�Hb;iE��m�e�f^HЗ�3����s3�6Mm��ԅ���,����=( �!�]�,q0���[�sA�y q_�R��nF��J(���\z���~�+�#�pe�j�"�z�.�]���3�������	d�[ �'>P-i|�N}~6v+��c\�o��9��~_��������I�C~��N���>h���͵~��'.�?>������X�����9/�:�&�>�P������+}~�I@s�u��9%�T�H�x���w��ڸ��$�!W�t�6el�v��^˄�|+XS/9N�
+����3����e3���s{�2�+�"�%3F�q��p�4�EyC1E�n�N�)�(�H���Ȭ���n�b��OSqb���d?�(�z����:��|��x�x�p�u��P~}�����2���0���E�?�#�B�_%�.��7M�~�L`R�M9=��-�-kݔ-L����|�	nx-l�w�R�K�,p�5���a<�V����unDm�#���v��h�Q}����[�����*脄4��El4��Z���qޢ��@�(K=�*�f-�f�}��˷�cx�K Ҁ��rQkVf�ތUMpa��[c���SZ �9�B)as�����O���W���NL����ЖM�\#Rͻ����|��bt��.���s�{��7�^rȲ���n�k�J���������e=�d`t {�L�c���ro{�uյ9߭���F�����	Nh�f�r��u*����p���=��a��l�� 0�<��}�H���.�:	�%;7����.g	s��w?��Ε�kZO�\�v�#��c�@�tR�-F>E���ҶEi�vJ�$p;>0BD���/�`"�� L��ɞ`��R'd�~��M*5�����*58'�*u8���(�``�j���EJ��g=�j�S���3������p��so���B�D"����oR�vq$-��p�T�`�Y��4e�%w�\_O��ğ�\̧�0R�EصB�=^�by�( v-$���$��&¶k�@�x|�#����W�J)�~^�WH�������M�U!��)9�	9/S��v����CD��j���w�&{�GG����� /�:���$[�98�hD���&E�pč�ǖ�g�xYE2n��,Kz����ղ3O�q_٭ �kJ����w�o�����>�؛@�"����`/��"��h�������"3H'��{���r��~��Az4ѷ���=�6��%�Q�8x'�e���mVly�(�۴����ʟ}�VZ���(#Z�ߋ#5�*�ׄ�:{��??!��~O���'â��a�H�TK�mHd�|�5Q_��9�f�\�&n�zo�0�AD�1�Gj���*6�%���'�-#��	���d�]�z�]A1�X1Oo:�7��~�细�iI���s���e)� K��>"���('Ib^����E E�y�	�����C���NW�d�[���5�*Z+X������E�