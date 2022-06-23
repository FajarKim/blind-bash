#!/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

lzshtmpdir=
trap 'res=$?
  test -n "$lzshtmpdir" && rm -fr "$lzshtmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d $TMPDIR && test -w $TMPDIR && test -x $TMPDIR || TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
  */tmp) TMPDIR=$TMPDIR/; test -d $TMPDIR && test -w $TMPDIR && test -x $TMPDIR || TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
  *:* | *) TMPDIR=$HOME/.cache/; test -d $HOME/.cache && test -w $HOME/.cache && test -x $HOME/.cache || mkdir $HOME/.cache;;
esac
if type mktemp >/dev/null 2>&1; then
  lzshtmpdir=`mktemp -d "${TMPDIR}lzshtmpXXXXXXXXX"`
else
  lzshtmpdir=${TMPDIR}lzshtmp$$; mkdir $lzshtmpdir
fi || { (exit 127); exit 127; }

lzshtmp=$lzshtmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lzshtmp" && rm -r "$lzshtmp";;
*/*) lzshtmp=$lzshtmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lzshtmp"; then
  umask $umask
  chmod 700 "$lzshtmp"
  (sleep 5; rm -fr "$lzshtmpdir") 2>/dev/null &
  "$lzshtmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs <team.thea@yahoo.com>"
  (exit 127); res=127
fi; exit $res
]   �������� �BF=�j�g�z�I���,;eb����YqC�gtJ��8�<d�����Gq���	c9ΦB�4z�ߵ��[�T9N`�xgwF�j<�>��ψ�}�����<'M<������$���������b��O�FIha"����7���ty���MAƥ���H�m��gt��}���K@3�ꘆY�d�ݯ�[$���ԋ�o�Γ��������Lo
�!{g|B7sZ 9FG���qitO��cd�^�7Ci��j���5��a��c��04ߓ�{��t��G�^
z
�BӨ1��y)e��9�������	�Gt��2S�^b���}�;Kcu�=�4 �k��TӖ�f�HѺ����Ҧe-�%�e+��_��/�5�|���	K裨��O�oY2f���T=̿!�Ԯ!����P1nD��r��*�ļ� �΁��a���@#�y8{6��gR��3j4d�>�}��a�Y!$��7�Z%�����%hE��� ��\� O@��l��w,��n�@-{�\fw�/Cc�'�
����.<F����}@����6{�ń���ig� Y�RW;1�n�csI�{������,��3�<����wC]*���IKie�>��%1�Crq�{m�(q�x��U]�z�l����
�4Z q)�q��]��Ev�ZBY��=Y���S�V琎y��ӹ�m"n�T�'w���̯�(��2��HO������8�b����T��:	�|]�3�LM��dDs+��[cffE�,e/��I9&��O��J��8�@rL�t�V��@n�O�t�H��엙1���J}��D;�T��L�bn'�r��ɹ��`���a�F����'��<<��h���'Rk�.S׏p�S��2�N��]����K�p�f I�ڋ�[vp-�zRi@�7P�Ԟ���0,�ń��;�*ڗ����@� �&��:=�8��2YO��;��b2�1x0�ѳ�Qp�7��G��:��Ϣ���r��}��B3��_e����"3%,7ges�;{�R���|z#"����Ɋ��To�Z���;�p&'�
�F��;S���j�#2���;
��z�����$��6�i�������ѿ����ćW�g���Q�Ⓛ���Ψ��,��M�`��
��gǓ��H���j�f<�Z�����´<���9HA�3�ӌ��%	ވ�.좄k�[�J������d {��!V��z���Rq'���V'�w�����0�N2�����m�(��0�,T�h�h�:�G�#�"�(İ��1ٟ���ա7c\�;}̲���Z<�S�$���x�Ʒ��A2�n�3��\�t�M����1e�/>l)�-�����ʆWm�^ �����Q��pĤ���Rv2Q�V���܎������*W�h���H���w@1ɦ�枕��w�,�����U'��t:Vn�+�ܞU�;���iZ�[�D�Y��V��|�O�Q*�Q�g��ah(���W+9���@��K��d&���,?F��7C���o������3���<�o���
�i�������\��̏�nϘ'��P��wNW+��c�&��m^���3.�N�	nN1�*݀���'($r��{���q�8�����⯲P����W���I 	&��9>NUo�̫��B�|��WW=�W���@�̧�Fvg�p��A����R�fX	oЁ[Q�G�!/7F�_J�-`l��=�2���ՌO�r��/�f[�=������H�L��jλM�t���6\���аI�y@�o��`tS/M�V�p=Saݹ[p���2��d�}�}>�I���F�������*R��f��Pߚ���05�>?��b&H�����XH:>�!��/��41�X��Au�u$���:-�_
�r�D~\Ԓ�E�CJF��9V�}��醤˂F2��u·�����6 �R�.e�.Ղ�Du��r���D�+���1��d�y3H�H� �/e�d6��ȗ�m� �+���㓕ŋ¯��N$���LO��Ȱ���w��-x��	Zlf�w����l��^��x����;r42�*�gn�~�����6�ۂ?��]��݅s�"7��>�	��Y�'��C���-��/����j�����*sM�D�K<j�\�v�+P-�[����%���^�(�T���б���4���=<`���Хd_J7�K��J�]łOi� �$X֞�S��/��%��q���.w��Q�skpS��"�-�>ދ�~S�0�����jHD�%EIqz�7OOЈϤ#�,w{�Z�����e��(�dT�\�݉�:�ȴ?%GDbO���4vIΛ������k
�o��!=���Wdv�c�d�	R��s��� ��N�:�sr�7
���!�h�J`�JJ(MH�tG�ϐZk�۵gD ��OZ�s��ϯD�L�̭���/4�n2vP�1b�j�`�=V�b�k���_J����1�>�\���U`f9÷�ی���Y+��C��܊��M����ش�]Nh���T�A�"���8���4%�j�&y*����u	�J����3��8�f�e�G�.;cq������BZ���b�۾���Nz��2'yM0���e��%�zxGz��5{L��a�VB���;�>W7<t��"��;�y���<P��#�W��]+�ulX/U;���ߋ�S��
=-�@yIc��"���/X�tW�!�ȴ�����A���6�)X�坟�f9�Se9���cQ�uS�>��i�V���n0B�YYUϻ �����g��"HM�K<T�%�g�s@��ԒP/�5�{БXA�<�N�K�t��;`�4�N���"�QN-v�0W�,J�k+:��(��U>��=���j���)��
bnm�Y!�K�(�&(��Pq�ב�w��N� z�|�Z�ȎOZ܄n����^�)F�� �����od���W�Y��F�����^e�`0�tx�̉F�M��W�r׽peuk��8��X0q��н����&��YM�)�hR�J�|I
�I z�q2�����!k�mL�>Kgu����TKǷ1����U9��RoUDuT�w�=1��.g##��j澪��$�)�cA�yά*]�77'��4 ��UT�'Q:$�a�J'��>[3�e$�1����|��h�uc���|���N�����D�֡_^��`�f���eT|�pc�f�Me��;�����0�k}�;��Ȇf�m���%Y