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
��gǓ��H���j�f<�Z�����´<���9HA�3�ӌ��%	ވ�.좄k�[�J������d {��!V��z���Rq'���V'�w�����0�N2�����m�(��0�,T�h�u�'֙��rг�v�pM���� ��ԱY=�܈�峢�2D,c�S\=y���#1�����sF�܉j{K79j*v�#�v_���0����g�{�cU|�!�r�Z��k�j`4�C����.��l!�[���g;�v~NI�v��s⼷�Y�%m��?/m��C,ܺ�mڡ�d�G��b�����԰@P>��%48�]I�ڽF<�iU>?�a@��5�#�j�."f\����}��f�i�Ls��k�IS֡��/ȶ��R��B��;#_'�C�0 L]��B�da��Q���[)�-��>u�`�*�ȵ��ӥE���ת���]'"���]�X���ב�c]iU�[M�{#IF�L������o�+��:j�6��ɗ*
*�� ��Fw��[i� �!�!�b�1cy�C����}�d-b>i�D�o>��u�I�VC��ΰ����<Y	���{�?���exV��ADCJ��ЦI'N�?0ǆ�)z��P�׳ʢ�hۃ e		 ;nЂVף�s�����b��f��Ɣ��61-���Z���E�nr�9P��M���rȼ��M�ȓ�b�~�᭟ (��u���<H'���i3���S����`G��m{�k�к�p�d#4(0��ob�� 4פ������[T6�>9w���u �tPMg��%�}����u �D\��M�G�&�4{����9�/�K��g��n["k��� n�!u��c[D�S˳�����9"\�X����A���u'J�uF7�^ʪ��6�"ϸ������5�� ���Z�&������>$���7�5b�H�\�%1�!�y�AR��K����_�k��a�}쬹� �4m�rh�پr8����C�,��Y$#�}���[�`�.o%�����rolԭ�"� �8x!�S~u/l��_I�Gq%�KMH��ë)�����b@�$W˯���tX�=�9��w!4b~�[@�����A�M1�9�l��0PnK
;f *�9�F6T�5d�i<kmܔa��s"����Ϧ64 f$��b��T���?d�:{3���Uo���VJB��5��V��C5&��J��Ŋ�Oba"�%��.����K�OU��� ���ք'��?"u]u�CW��A7vv�^��Ȏ�,<$�4+��i�沄ȴ�΂z�J�	�]�U*y'�J﬩L	�����7�����Pe�/N�A����Cޖ����9����|%DCĸ
f�Z��R�c�Ԍt���e�me`/)�jx傀�'����Jp;>���-�:69*h�uc��~�Xx�=��3t�+�ڵs���t"��Ov�������:��=;ð�>>�1L�S�h(�a�C�^G�z�Y+�\/�~�P��k�W���ߥ*pm����(?�>�m�r,�Ʈ�p�+H�g'���l�[n��Ͻ�49���j���iĠz��E�!�yN.�\�`�*M��7Ie(�,��v3}�:�a͏�j��'��G@�{ ��_����|���3�o!7�?b/��9JB���V],O��Q\��_OZ�6ԶZ�D�ם�`V�0O��tp3T����J�Lj��I�ץ���1��m_�˾�[�!����_�ؗ9G�,Th_m�F�4�N����Tj@+��=�_i�u����]�YW�$@�8^�����/�U���-�}��" �ك�!�ע�
�����?�����-�Z���u�6H�i�ƣ�E��0�o�&�}҄�kB=۪aҥ���S=v�9g�=��췥����7H~y��\�p�?v���x��7�<��~�S�N;�5��`K/�&��q�},~�7>K+I��M5�_����C��[�-L �%�l�8vx���	3�
��)_��>�����6����3QB1m������o��-���&��|��z�!#
&6\^}�\_�<L4N2�V׈�E��[��\�@$k��ULU�w��'�d_���<"����ˬT}-�7c�ԍ)�:��,��|� 