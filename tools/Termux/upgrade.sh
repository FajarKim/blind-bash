#!/data/data/com.termux/files/usr/bin/bash
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
]   �������� �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��f��:����Y����"�sG�h�r�;mz����E�e����f9Hu?�h�P���l�K�2`���M�:�g쫂�t��`<剢�eT�='C��6'�Q�[�N�3d���/����S68H�d�_4�N�B��~�eH�̑A�����48��esWr� Tz5L�g��ΐ�.�5�7���t�}@��P��]��'������z��m��%{H��d/�0Q;1�t]�/�&�����;e�hѝ{�᧝Lf�^�6��'v��v��H��l��p�L�;�aX�dN杖k�h�u�b�-�L���\%�HBW��X�<�^��Z������%�{L&��J��%�����}Цh��b>�l,r��"o`翜��F�dn�E��ڡB��'�ٹ>��oz��a��f�5X�ifC ln�٬�;@+Q{����\Bq��IKl�s����F�F��g�$�q�.�a=Fv{<� <vz뷚nΪ�4��@(:���� D��|V|Ö�( +.��{�_ b)@�sHo��#3�)З���_׹�K����{Ǥ�߫
��Df���R�;d kЗ�)*��pS��O؆��p��(k�$j�\�x����9�:H����6���r�/1j�@�� bb-^"rVO��h�4�yݖ�X��)�_h��Ӊ`ԥ&{*�� s�J<d��glF��J��m�<�we����Tt0�&g1`%���w�T˕��0>�����6����,���{+��~i@��$�1vk����L���i�X���P-ُ�����~1k}h������L����$e)e�:��S�v��l?����l��������6i��g0�~6��[��"��?���(� � �M��^�B��<!��8�nw�u�)�Y�1�������\b�ɏ�`t"����?f�ǧ���5,��
 CM��K40Uk����̇�U-��*ۥ����"�DV����Ի������ޫB�̪JLx�d�w��cC�)���3vi�h֖	�����6W��z�̞�%��T�ct7h<E�i�dD(Ѐ��ؠ��J"-2�(G�G|�	%����o8��ϥ����е��f����g����j�e���ϧ�ru5��!$�	�ha�U�Q�G 5�����ܸ/z��3]�f�%6�z!��Y�k�8�5�����V�"SԼy2�g�bw�5������ ��"$���0B����������\�	�;�{��0����Õ�f,��¤�UO��7rl�B?(ߐ_V03����J��F�vM��,�0G�p	���E}V�N�&�9�o �둆R%Һ�S5`�4ĭ����5�ƒ�J�(KȎBG4�9
�r� �0�?�ۊ?���H{$�@5�+��}���۱�Q^�^J�7��UUBP������y-B��D�MsE.&�<�x!�]m䎡޻)?M[w�>O8�D�5oӂ��B,S����#���k�죓Z'��uv��#Y}�B~=�9�j~ѫ^=�����f�L_薺��xjk!<ĲݓƔ�_����n�ނ�,v�Mqo�	��7y:��ɟٸ_]x�ȩ{��O�H�ᢵ'DӹViM4�u�	�%%�c��1I���,����
�tK~��c�EŨĶq�9>�.s�it�\�+��띙�Q3[�K���jk.��;

������"O6�,C�$�/���a���_�=ĺ~�o�
fô�X�g��2�V^�)��3����8����BR�S�����9{��R�bso�b?^����N��Uj`�=���RBX~�
S�l^�<�T���5"�Q2:}�V\5e���]<��w4,�td��Jf�@��2y��<tsi%��Wn���A�x�Rq���WH�ndў<�q�&e����YW��)0^��S :0m��v3��p����tp
'�ӥ7T���:�s�������A�K���FT�&.l�<~�\Y,aOg�U�M��k$����ZվH��Ђ��d���bd���z,��Q���֮_3�̒q0�d����dʔ��g�N7h�d�Ome?�Y5�AY������½X'�e~C�qh������e��xړ�1�{�%n�rSzx"�дa�W�%�G2vp^昧�/�����s��S�s�0�`�-^���,��K~�G��
��j���D���i�t�TK�m�u�[zu�q<`xH�
e}
�<_Q�-��$lk��Cg��	BK�о�i,��5n�X�	�#i��ZV+����K)�dJ)��JC�0/>wb
���:�'�_���5�;���P�r�t����%
���(a|/�X�x���ކ� �R5g��i�@�\�,?!H�*�d;�������W-?n�W#�?��5�wT�@����;o�gHu�o�f����Z��PB��*j�8b^�j�<@RV%���{"��QSXr�W�ǐ��O���ߙ�֡JB��%��I?�2cd#��F��!��}q'9���X�"=���U֠�"ez��K���C�dԸ�Z��J;�+澹m�������+]
�ty�����2�8�8NJ�G�����g0�vK2�D�u��ݓ���Qξ��cqM��b[�m'aH�u4>]��z�9$)>T9X��X�ʗ����I�r
iln�oѽ�i���pW��q>¥��!�.츆#-6�b��g
�I6�jK�?r��Hy�
�����U��0,n��7=t�i���\!�� ^F��X��b&�Yʤ�<{h��j�T�
��^�P�S���l:� H�Ͽ�q8�3st�j��3l�w[L���O��HwE.�bڑ� ���?[;QLb���:'�������xL3[���xq�:J����ؼP���4�yI�1��� ��?����Qb�O�t�$��4o�"C evC{��ɗ��Vٟ��ĆT�a���!��=���� �g`�Z~�\��~�'�1'�O�ԕאR�����������,��̪aC��2�^`qw�,��f��5ϒ�������vʱ���8C6 �I��9D{�T�꽁l\rhQI#"�@�{�)���5�����NB��;�R��6<W3���&G���#�Ҧ��N���sD0겲R6�a)L��i�1T݃[�Q�_2��Cm�:'�KD���]�嚺�it�B��� ��7pN.�JU��
��}��>ݥ6bp�%����CV:�J��٥\g��ڮ}JgP�P��S�_����"�����$I<zRD�-�HQ5��ovVH�02X8q�Ln���R%�Hb���A`�uH9ͥ}�@�[�����i��ʣ��n�2q��ե��HS!Esf���U�����?#�,/_I����Z���qnEi�{�8�{˵��l�mZ���ԛ���I�*7M�1称�1�%ӹ���bI�Cf�z:�=�"O1�;̼̃�!�����g��;��~�����S�tW"E�s����t�j�#QZS�)�f�4��+v�i��x`������R�[t<��⷏p�2�0M�r��(�I��Hc�:�������Z�NBT�SM��4���*�8�� S��"P�d�0���7a��x��NvŤ0\�_��8�m���WP4Pgؙ]30��iL}��)5�EZ����v�z��^a���;��$�l�1�+��	Ŵ�I]lJ��D����� ����W(�E��2�A}?5M�Cޅ����=�ko�q�c�����N �_�T��ڑ�� �}��Ѹ��r"w�{H�w?R���3�l�@VG3���&��a�c]�s��{��2��������/A�	z��pϧ�g�L�=��O��(i{��`�o��5T7*R|Ea$b'��g�e�-�r�ݠ�e�
��fo#+3��5�%�Tҗ�W����8��?u,��6nia_b��ͮ�UMΣ��
ܭF�$4�}OU	����UQ�P�$������v?P�|�aJ7���&y��
��܉�C���K<o�>�I5�R��oMe��g}U���J{�c����ٖ�d�yj�7ߌ��I�	��
#M� y>W�l���g���!]��蘿Esv�V�xr��_� ���|��|�q�~y�Rضdvx��\���-l�v�.�X�%�A*e㝋���g��5+��b�Eq$�B"~Ȯ.�D�NF��j
]e�<\=9N���Mj��8��0���aO8��$��,�o�b�c%×�MTl��\V5қl������b�1������T��y��Y״b��'�Y���j����2B�Xs��`C���O戯.%��l�|��{��v��=Q�T������3�+�:{t�F���.!� �az B0擼D7��4	��wb� �+��/�S����a`���s���)��w���(���N:Źk��K�xk�2��C�.�׷�KI��A�C�����k�y3�ҏ@y�7�
�K^�?�{Jy���ʦ2�w�Jx��ӿnEi�6�i�&L�9dm`��O�z���O��Zg���[e�����`��0��^$�q������?f����8�Z�HsF'PaYA^���~�;