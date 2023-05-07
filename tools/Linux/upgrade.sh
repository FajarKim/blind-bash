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
+����3����e3���s{�2�+�"�%3F�q��p�4�EyC1E�n�N�)�(�H���Ȭ���n�b��OSqb���d?�(�z����:��|��x�x�p�u��P~}�����2���0���E�?�#�B�_%�.��7M�~�L`R�M9=��-�-kݔ-L����|�	nx-l�w�R�K�,p�5���a<�V����unDm�#���v��h�Q}����[�����*脄4��El4��Z���qޢ��@�(K=�*�f-�f�}��˷�cx�K Ҁ��rQkVf�ތUMpa��[c���SZ �9�B)as�����O���W���NL����ЖM�\#Rͻ����|��bt��.���s�{��7�^rȲ���n�k�J���������e=�d`t {�L�c���ro{�uյ9߭���F�����	Nh�f�r��u*����p���=��a��l�� 0�<��}�H���.�:	�%;7����.g	s��w?��Ε�kZO�\�v�#��c�@�tR�-F>E���ҶEi�vJ�$p;>0BD���/�`"�� L��ɞ`��R'd�~��M*5�����*58'�*u8���(�``�j���EJ��g=�j�S���3������p��so���B�D"����oR�vq$-��p�T�`�Y��4e�%w�\_O��ğ�\̧�0R�EصB�=^�by�( v-$���$��&¶k�@�x|�#����W�J)�~^�WH�������M�U!��)9�	9/S��v����CD��j���w�&{�GG����� /�:���$[�98�hD���*��I�L1�9��F��B���aE͊���ē��� ��=���5んD�������1����+b�Z
ϭKj��3�N�Z�\X'����l�a범U�����׃%ˀ��� j���O�oŠr���cД�L��_��=��C́�mQ7R��
�	��@�$+���;'���9���Uװ�Gx4����{h��M�}07��<��H��-���g������ó�bZ`lK����4�c���.�^s?*����:McR��A������y�p5��x0M
Ǚg����'�����WA�~9Àk�8�R|�(W��]��4����n�iY#jof�R�u9eORv��}
��i%�Ƕ��(����}Ƥ*宱:��
�mk�C�.C;y��̐h4��5���j�o�}�! �Ea�r�⺑"j-�˴/�R�|�ri�6��ڂ� ����$��ɒ�0�K��Y,f7-�~@ �K{�8���;�0T�"��bX��s�����㧗��T4��r�rD�_�^���Q�8�v��;W�����cj��1����|¯�,=bz�;�y�{ٳ�N>�p�5/��ٗK a��F,\qs=�n�1��;3�h�t,��4�}�Z�iD���l�F���&'pmۡ1!W�f��ˌ�����!�Lg��>0�B���ӆu��d��ϱY�?gcf�&(:nG�c�É��]XzA�\IB����V��
�ҥ;y`K FM�z�[�宓�����9aE���83��W�7��rBs9([v���;P.�|��x{Ω��yA�5?k�ݙ���&A�mI�,T�xꪲ�l����mPD��	���?@+��?R��
�����M���&}��'��D�s �	aK�պ���+�xH�S�'��v��j o���l���)S�G�?V'��Q�k˛Q��S�ܖ��o"��I����uW&p��+/g+0_���"�*�D�A~&�jS���Ӗ��A[�4�(z�td[i�0��n�f�sK���2���`>���0�.2��S<�m'�bz�µ���~�Eǅ:ejŒ3�x4��M��>��؅��Zs�X{Tq�p.�����14�[�/\�c�˳7:Flɨ������-B�t>��[�[�emfN�Y৤�E�~cܑm��:m��r��g�be7{cӰ&�"��e �3ΈE�I�6�%hF�`d��@l(�Ib��Q�
h��R�,�笫p�eh�nx�׉mz~��ӇL�"v�c�kv��� ��qJ�3����0�X�7VD>XD���|4yPq%���@�3N�d'��&��D��=�ӂ�[d�"�G�*&O���X+C�y�C�k^Ҏ����ba2�44�]�c7�il�p!��p�������ܑ�K��O���b�<�g���d�\�'`]��C��|t�Y�QYAR 7U�isOq���>�O����=2�Ap�=���G����0=g-��EgWD?>Ab�*D�_0�IsK�]<�*)$����S�Bg0s���-:n����_��5�#(�o�#�� �Į�eA���)��L0Q��U|�?D�
��D�1��5�Q�l�KԥcD����@�VmO
�_N��;븲̗��7�*����n0�%%ONX+��<9�E�5��&�M$�}�(���"�l��;;�/���5�"ܨ�� !޺�?ɨ��ӫ�Lwx��+���y��ꗹGq
2��֛�8S��_Fɷ�b�=��Ff��qh�-���N&����ܘ/�49P"]L����_�$��ɷ�(0�/[�#��z��r��BH���2k!$��SR�/6����r��.��)�� }66.p)]Y�����?"��l���2t��c.���U�� O�u1c�Җ]<�mxw��	&�lU_�A��:B��*�����+���؆^@9��S'd�S��:*��'Q���Bb��U���F ��xk�X�=C+/6D_�<�O�<2w��0�S̏���C�l��J�byu�������#�k��K��>���c��OOoÝ��G�Ի��Qpz�:����H��y��f�~�V��V��9ΪsƤ3�G�B'8�KN�.п�B�61|����\ F%^��u��D�Ɣ 1N�H�d��܄,�`�o	8P����{ ��sߏό�*��l�O�)K���.�es|he��V+z܏��E���|�J����~;�C ˟l���9�=��:��a�@v˰��	)W�5E�Ia�E���eDB	1bP݋���,B7΍E�&&�q�^{k�����}��%����5'�0]N,���U��E1�h}Q;�,�߽�����ϊQ����#�+��p�.ru>fr)zL��'q�[��6'Ϊ&,���cl�Iv�n���*�r��
V���f�^=���l6).�l-
=��Qo�t��Y]f��u��;dQ���܏q@�x6,��d�m/O0e��ơ�Z��άIj��@{���BWE�K��\�aj��H���xՆ#ſ���Fy*g�����Ѫ�gy�>�"o�f��Ѻ�T% 