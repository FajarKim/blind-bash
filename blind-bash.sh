#!/bin/bash
# blind-bash: tools for obfuscated bash script
# Probably not compitable with some device.
#
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
skip=82
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
]   �������� �BF=�j�g�z���HȓMl�( -µYd�d\�����|f�:��n�b42���,�)�G�Lp��d�.+���*��E+��B�X���L��3 �_��� ����B_��H��T��7� 'c�>E>9��R�k|�F�򾑟̔W�l�X���{��O��Q6A�,�C�7�>����G�H�0~a�ʞ\S�P�^>�_{��[��[|d���eG��(Η�w�������������
�0���S:z���	|]��Q���% R�?��fa'��T�\���I-��{`@!�����QbQ��qIo����׊�8"�2:�L�@w���e�]�Vf@��i&Y�}M;�� �)l7X%�����q��2���[�S���$eG5�jl��b�}6�R �,�^|�M��^��	�O5����Skb��]�^nB��-������n�޴�(ҝ
]�+H݉(���_4_{%vi���b�md��)MF��Y
��w3]gɻ��X����íۙ/���s��?W�)����Bi���"+�&�E�������^im��+��z5�X�,�&�V��c�8���������}N$��^c��PRװ�R�S�?D��/2�:�׻�2t��LxNH9��~u���%�<6l��'�����@��B��
z�yQ�GȵF��Ҟ�@�a�N���J�<�\XV��n�rk�a��{%��P��,��cW��z����K]��E��ƉΨ���N�T��KwE��D�'�됰�!{���o�����7L7��_
ƄdD��a������C%�:�F�f�!5����$�*���{I#��QiWw��Z����	�~�+����P\Va���
�4ɶ1�]���6���t��V\�>��-��2ʇL�>I�Xp�lN�2$FK,�x�<Ei�q�w,����GX�;�8����l��?�>`�p�ۃ�����S�Jת�[O��JOA9PU`�<���|σ�;��!�,��)��G�/�$�����O�YP�9AN&Sk",a����
�꯲ZuzŌ4����D�?-�G{,���4e%�?�u�Mm�J_#F�c����d$Hy��l0����ӳ�̥���C�`�ۓ,�7�3���	���:2��]φ#�ʱ���]x_�t�4ʩzoR�<�Bz�`29{{�����M�Ҧb6��/S�	-�bK��-N��n�Y��Ob"��8.��s�m�?��S��0��-+E�����nC�;e�'�����-L�O�o©%w�$��(��������=Y;�䚀ok��R���Ӗ�QxɣS�����;[4��LS��%���p�C��zFP�L����a�m4�b�Gp&/�~9_5+��H�熋����#��1� b@-�(�;��f�� �k�?�*"���)��K_��cN��(��w�&7���K�6�M͟W�,Y�)��ςuP7�6��� N�w��?�+.������3��֊�$�0�F����\�?�U����0��]��s��M{�߅3kZ�
h�ޮ`e�^����Y��A����hH�N�¿�P����wO`�E�b�|^v���6XGHDg?պ�t�#�ZߴK$�˒�T�'l��������ס���\o�,;�LE������t�:���}���W��f_��;lix���xkL��-�Q���i�9�����/�@F�w��&��vƯ����tIv�Ŵ�5&���2�W���uݢO��xM�V��8�L��c<=lj�T��sZ�����!XIA�%�̟>/+��R5��F��?����'�%*����N^긱BIAKH��)���P ��Ju�?\��#]S�D�[���K~sB�`\]R�$�,_��^Uo�׵Q�*ቋ���P߼�c>T$%�@����֬o0�mł�`<�� (��K���lV��IfrS�b��40*9���/%���<����H�|�	<|���
��O9���p޳�OA���-0�7���S���$�1.�'��T@�ڄ��Ћ�f�BQ�#Hń�I�L3�����$c`�����D�5Na$�!��/-O/��2R�a6�,�J��'1锹�I�ز�g�5�Jé/�j.�4�C�������M9]�R܀V�[O~�������Ʋ�گ'���_t ���X��<�"�
��K�0k��rH��9mngݣ���%X��ֵ��T��@��Y����N=�$����o8#�zoiًb~�{�R5h5�M��v�١P�ّl�M�,Hu���q�|~���#K%�&�����a���W�r�6��XwjL�1��?�TO�2��7YJ,�"r�k����c�\*�_�Տ����_a6��� Irb5a\��4���d_�����Pw��C�]��\ ��=t�<�X����'݇
�ѝT�%��H#�����h��q$��钓���EG�ߌ�V���Dn�g쮇Ƞ�B��PׂF)�
��xg��W4���3Y�����,�f�m�T�� ��>��)��3Q��Fu*���xa-��|=[u4N�$�������-�����Rk�XF�~f�O����y���
�z�Z�\�����YHȯ�? �2.��#�P}�H�E
�� -���?/�//k��*o#��ѵ��"9߁"S0w(�N�G�l�i���9n��Ե�%�/a�C�k�㙒�W���#�{����6�r���a���[�*�@r<7S���A6w�A\M��i���:�{��p��^���u���ߪ�Ob%�W9�����d���s�*:���T+�'N���j��a�i��!�-	H|F?&�j@�O�,y�vl��c�>����j��11'~� �9K�Ԃu�����"B��-����5��)cˉ�S���؝@)_Ely0lF��`F�r�����m�k}�n�gDg�4<~����8�LX��M3��JҔuL(��~t��
f�� �b"S��&��#7�W���oA�>_iMa�J1��0Ғ����h�.��'>�%\k(}S�����h����j�	��F���M��9���	%Y��k?��"�gyvQ�o��a���; C1��:�vl#m�|0-s��V4&�ç3?#$B�áH%B�m/p�6$�S�x�r��#��9��4S"�`	�Ł��x�P�Ϣ���WT����u������/',:�ܲ"�P���Y��+�8�aFƲ��R#u��-Qx���x-��P��E������W�u̾�ӇPְ?��X��O�؄�'X�'^�c��)y�x��+XM�����[t��!%0u*v�h=n��W��sC�+����O�q�ø��a?��^���%G�e����n�#/4�ǅ��i>��@�VI�A�Q��=#-@	�UZ�d����("�;�$�Ҷ�cU$�_�=�����9���u��(�v���78!��h�wFQ�D�˄�F�"��m4���̺/&�'fJS�O�r4�q�4��ͧur����El{p8�8� �n�tE�S{F�\4�oy�釶6Q�!d��A�!*
�ZJ����Gvi�2� �3������=��K�3�YxVu��B;��?���b5u)�t�Ȧ|T�l|p+�&p�O�c�� ��!Oø�mF$'x�u��F�It���;���>��>x�K..uW�O�f��[_��:�;����B:�ثt%B9.�&��2��/�"���� v�c���]-�D�rY��k���y�<�����dg�J�\��TBW�ŏ�H���T�㓲��Ak��L9 P�(=����`P���6�T3�(P+�f��W+^����[��~�Z��T�Jv-�Z	��x%2�������b
�������|���}�Sf�ev3�����>߲�o�M*40�e3�9HrT�����?;��BA��2��X�"1�2����� {�K-�\��X�F��|��
���A����7䠁{�'��0�U��%�ɛx���1����\����I���B2E�p�˫�#�t�I7u ��j��`�$}����(��)}���rC��
�˩"S��J�t�+���~/��f�JW{�'��]�2��)�Mz�B`#.�hUC���S1LU:9�����%I46x1?�E�L/��a4��<&G=���+���9�#��uWH���*!g�^K�ܥf~O5H��>1(~p�� ۯ��9ǫgz�V���LQ�y�6�6�&j"~]j�s��G�E�>��hbTu���f��aLc���0�7O�֒a�
g2U�SgLhȐ�V$,U>��4H@t�d�'���Q@��癛�׾�����a�������Q�p��E��"K���*�M3Ș�JF_�)cv�o��+� � ކ�&��x.5��*nBښ�Y�!��6=m�����BQN��	�?hѸ�9o��Q{`�]�g���i:�	C�ȣF�o�na�g{8]�f�#;��������E���[1��`����!��G+���_sI��'+]�7Åf��:����D�+��e��m{rˠ%��a���0`������Ť���	<��;A{xO|�N��J��M�f]�o1&��ސ���6R��ޥL�#!_���	��N�5]��M�< �/��b#*���/�5/�n���rzN�7$<�ɦh.z�O���fH��1�ߦrY�b/3tғܥy�D�%�軷����]���(����oʈ���5��w�����+�e��fP���a�c�emU(V�����;���M��S����Ò��#Ȯ,E@>k�[͚h������撃�}�,Kqi�Vr9�m���:yt�<>�z�x�{Ȃ���<(��P-JF�LY�SݘRD����=�-��6��e�h��s���U6�~�Na�e(kf�Nh���P��rx�_�#;�Lul�H/y�-����CN��qXt�#~�K�s�ɫ�Ǝ���E����+L�#`�z2���t�������J��V���%��'2@��$"��0��F�9���*RG�\�q�?"�Ղ-�v�!$���b��B���<x�zl6Z4��w'i��( N�	��
^����,�½m�9E����m�����q�����#}�:�	yI����p��3�50�;���b�W�z(�=�H�@�Ks��-��lr�8����J����*�D�#t�A�$�S4���\�g�S7�W����(篼<K�R��8y�7���u���:�/�G�Ѷ	.{�
���A�~�%��)�
oQ�.��/�B�D1͆�����|8����	O��3?w�o�*�,Ll��uo��Y�.����n��˿-=�'d������w�R�(����S�񳡯�Bո���=�� ��ZfҶ���Jϛ�܄u�M�n��Dghox���Q�LX]�
X#����X���?�v�� �N��i�f|�΍�ோH��AG�W���1@��Ζ��r�e����B�İ��ća^Hi��r!��`(�v|Q��`(7V?I3e�2�W���II���ML�}�F�^M��:�*�ҙ�9�sc��J�c�`.3�T��c�)��'�PO�q�rr|�����^�a�!�6�e9��fy��R!��r�}I�ݔ�g��.�Ԣ�m����+�P��:j��n.��4Ǎe��Mͧ�n�ѐ�e,Z��#c�X�$�����K�f�V ��|/:�`L�9���>/e�܉�}��fQb�|���ERI��A���#����Ĩ��*C�D; �2ͅ��v����u�K ����KQ)sV���qc=�!�l{� �@�dp9x����e���Q�����\C#7d���M���S�z�tfւd��1���vHK������J�:�2�O�K�"��ӡ�W��	P�3?�qڣ�eו=��Of';�b�v���A1�O���pb_�C�PΙd�(v��l"���1�W��]��A�/x=	RE��Y�����et���[��<R�?�Tq�	�FU��u�&Ni�n��Z(~����6b3U�g\j�u���8l���߹/D���W���z�~��_�Q�r�2i^߸jo�����F����/���G�"�G�E�F���蟅�j������u٦�8�٭�1��W���H�G��I��9Qv= ��,������"|��˥��꽇���B��֗DV��ӤgQ��49�|��MнP �P��X��G�d]F4��z��{�,Y	x���uŪa��bu��ޙ�|0�h�R֔S�z6Af�K >�ꏮ�> �����'3�����t�4:���?ՏD�)E�ܤ��g0>/��j���"B��_��֋����n	�
PfJ��5#�>��U���{�-�aR`�/�T�f;�8Z�{J)���᩸�Q�Ή�iQl x2T��-��V�K�����L�^��s��4v!9E����fC)V��Ѱ=E,��e��T��!���-=�����U��Kn�v������U.'��T�&纮ݲ�
���s^���FݮUa����7}k>m
�5����E��g���R�E?�.s��H��