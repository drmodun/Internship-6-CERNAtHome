PGDMP     +    9                z         
   cernAtHome    15.1    15.1 H    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    18623 
   cernAtHome    DATABASE     �   CREATE DATABASE "cernAtHome" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1252';
    DROP DATABASE "cernAtHome";
                postgres    false            �            1259    20134    acceleratorprojects    TABLE     ~   CREATE TABLE public.acceleratorprojects (
    accprojid integer NOT NULL,
    acceleratorid integer,
    projectid integer
);
 '   DROP TABLE public.acceleratorprojects;
       public         heap    postgres    false            �            1259    20133 !   acceleratorprojects_accprojid_seq    SEQUENCE     �   CREATE SEQUENCE public.acceleratorprojects_accprojid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.acceleratorprojects_accprojid_seq;
       public          postgres    false    219            Z           0    0 !   acceleratorprojects_accprojid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.acceleratorprojects_accprojid_seq OWNED BY public.acceleratorprojects.accprojid;
          public          postgres    false    218            �            1259    20120    accelerators    TABLE     r   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    name character varying(30) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            �            1259    20119    accelerators_acceleratorid_seq    SEQUENCE     �   CREATE SEQUENCE public.accelerators_acceleratorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accelerators_acceleratorid_seq;
       public          postgres    false    215            [           0    0    accelerators_acceleratorid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accelerators_acceleratorid_seq OWNED BY public.accelerators.acceleratorid;
          public          postgres    false    214            �            1259    20162    cities    TABLE     |   CREATE TABLE public.cities (
    cityid integer NOT NULL,
    name character varying(30) NOT NULL,
    countryid integer
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    20161    cities_cityid_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    223            \           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    222            �            1259    20151 	   countries    TABLE     #  CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(30) NOT NULL,
    population integer NOT NULL,
    ppp numeric NOT NULL,
    CONSTRAINT countries_population_check CHECK ((population > 0)),
    CONSTRAINT countries_ppp_check CHECK ((ppp > 0.00))
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    20150    countries_countryid_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    221            ]           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    220            �            1259    20174    hotels    TABLE     �   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    name character varying(30) NOT NULL,
    cityid integer,
    capacity integer NOT NULL,
    CONSTRAINT hotels_capacity_check CHECK ((capacity > 0))
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            �            1259    20173    hotels_hotelid_seq    SEQUENCE     �   CREATE SEQUENCE public.hotels_hotelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotels_hotelid_seq;
       public          postgres    false    225            ^           0    0    hotels_hotelid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotels_hotelid_seq OWNED BY public.hotels.hotelid;
          public          postgres    false    224            �            1259    20127    projects    TABLE     j   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            �            1259    20126    projects_projectid_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_projectid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projects_projectid_seq;
       public          postgres    false    217            _           0    0    projects_projectid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projects_projectid_seq OWNED BY public.projects.projectid;
          public          postgres    false    216            �            1259    20187 
   researches    TABLE     w  CREATE TABLE public.researches (
    researchid integer NOT NULL,
    name character varying(75) NOT NULL,
    projectid integer,
    numberofquotes integer NOT NULL,
    releasetime timestamp without time zone NOT NULL,
    CONSTRAINT researches_numberofquotes_check CHECK ((numberofquotes > 0)),
    CONSTRAINT researches_releasetime_check CHECK ((releasetime < now()))
);
    DROP TABLE public.researches;
       public         heap    postgres    false            �            1259    20186    researches_researchid_seq    SEQUENCE     �   CREATE SEQUENCE public.researches_researchid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.researches_researchid_seq;
       public          postgres    false    227            `           0    0    researches_researchid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.researches_researchid_seq OWNED BY public.researches.researchid;
          public          postgres    false    226            �            1259    20201 
   scientists    TABLE     �  CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    dateofbirth timestamp without time zone NOT NULL,
    gender character varying NOT NULL,
    field character varying(20) NOT NULL,
    country integer,
    hotelid integer,
    CONSTRAINT scientists_dateofbirth_check CHECK (((now() - (dateofbirth)::timestamp with time zone) > '18 years'::interval))
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            �            1259    20200    scientists_scientistid_seq    SEQUENCE     �   CREATE SEQUENCE public.scientists_scientistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.scientists_scientistid_seq;
       public          postgres    false    229            a           0    0    scientists_scientistid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.scientists_scientistid_seq OWNED BY public.scientists.scientistid;
          public          postgres    false    228            �            1259    20220    scientistsresearch    TABLE     n   CREATE TABLE public.scientistsresearch (
    scientistid integer NOT NULL,
    researchid integer NOT NULL
);
 &   DROP TABLE public.scientistsresearch;
       public         heap    postgres    false            �           2604    20137    acceleratorprojects accprojid    DEFAULT     �   ALTER TABLE ONLY public.acceleratorprojects ALTER COLUMN accprojid SET DEFAULT nextval('public.acceleratorprojects_accprojid_seq'::regclass);
 L   ALTER TABLE public.acceleratorprojects ALTER COLUMN accprojid DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    20123    accelerators acceleratorid    DEFAULT     �   ALTER TABLE ONLY public.accelerators ALTER COLUMN acceleratorid SET DEFAULT nextval('public.accelerators_acceleratorid_seq'::regclass);
 I   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    20165    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    20154    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    20177    hotels hotelid    DEFAULT     p   ALTER TABLE ONLY public.hotels ALTER COLUMN hotelid SET DEFAULT nextval('public.hotels_hotelid_seq'::regclass);
 =   ALTER TABLE public.hotels ALTER COLUMN hotelid DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    20130    projects projectid    DEFAULT     x   ALTER TABLE ONLY public.projects ALTER COLUMN projectid SET DEFAULT nextval('public.projects_projectid_seq'::regclass);
 A   ALTER TABLE public.projects ALTER COLUMN projectid DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    20190    researches researchid    DEFAULT     ~   ALTER TABLE ONLY public.researches ALTER COLUMN researchid SET DEFAULT nextval('public.researches_researchid_seq'::regclass);
 D   ALTER TABLE public.researches ALTER COLUMN researchid DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    20204    scientists scientistid    DEFAULT     �   ALTER TABLE ONLY public.scientists ALTER COLUMN scientistid SET DEFAULT nextval('public.scientists_scientistid_seq'::regclass);
 E   ALTER TABLE public.scientists ALTER COLUMN scientistid DROP DEFAULT;
       public          postgres    false    229    228    229            H          0    20134    acceleratorprojects 
   TABLE DATA           R   COPY public.acceleratorprojects (accprojid, acceleratorid, projectid) FROM stdin;
    public          postgres    false    219   kX       D          0    20120    accelerators 
   TABLE DATA           ;   COPY public.accelerators (acceleratorid, name) FROM stdin;
    public          postgres    false    215   �X       L          0    20162    cities 
   TABLE DATA           9   COPY public.cities (cityid, name, countryid) FROM stdin;
    public          postgres    false    223   uY       J          0    20151 	   countries 
   TABLE DATA           E   COPY public.countries (countryid, name, population, ppp) FROM stdin;
    public          postgres    false    221   rZ       N          0    20174    hotels 
   TABLE DATA           A   COPY public.hotels (hotelid, name, cityid, capacity) FROM stdin;
    public          postgres    false    225   S[       F          0    20127    projects 
   TABLE DATA           3   COPY public.projects (projectid, name) FROM stdin;
    public          postgres    false    217   %^       P          0    20187 
   researches 
   TABLE DATA           ^   COPY public.researches (researchid, name, projectid, numberofquotes, releasetime) FROM stdin;
    public          postgres    false    227   �_       R          0    20201 
   scientists 
   TABLE DATA           n   COPY public.scientists (scientistid, name, surname, dateofbirth, gender, field, country, hotelid) FROM stdin;
    public          postgres    false    229   �i       S          0    20220    scientistsresearch 
   TABLE DATA           E   COPY public.scientistsresearch (scientistid, researchid) FROM stdin;
    public          postgres    false    230   t       b           0    0 !   acceleratorprojects_accprojid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.acceleratorprojects_accprojid_seq', 25, true);
          public          postgres    false    218            c           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 1, false);
          public          postgres    false    214            d           0    0    cities_cityid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cities_cityid_seq', 1, false);
          public          postgres    false    222            e           0    0    countries_countryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.countries_countryid_seq', 1, false);
          public          postgres    false    220            f           0    0    hotels_hotelid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 1, false);
          public          postgres    false    224            g           0    0    projects_projectid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.projects_projectid_seq', 1, false);
          public          postgres    false    216            h           0    0    researches_researchid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.researches_researchid_seq', 1, false);
          public          postgres    false    226            i           0    0    scientists_scientistid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 1, false);
          public          postgres    false    228            �           2606    20139 ,   acceleratorprojects acceleratorprojects_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_pkey PRIMARY KEY (accprojid);
 V   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_pkey;
       public            postgres    false    219            �           2606    20125    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            �           2606    20167    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    223            �           2606    20160    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    221            �           2606    20180    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    225            �           2606    20132    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            �           2606    20194    researches researches_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.researches
    ADD CONSTRAINT researches_pkey PRIMARY KEY (researchid);
 D   ALTER TABLE ONLY public.researches DROP CONSTRAINT researches_pkey;
       public            postgres    false    227            �           2606    20209    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    229            �           2606    20224 *   scientistsresearch scientistsresearch_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.scientistsresearch
    ADD CONSTRAINT scientistsresearch_pkey PRIMARY KEY (scientistid, researchid);
 T   ALTER TABLE ONLY public.scientistsresearch DROP CONSTRAINT scientistsresearch_pkey;
       public            postgres    false    230    230            �           2606    20140 :   acceleratorprojects acceleratorprojects_acceleratorid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_acceleratorid_fkey;
       public          postgres    false    215    219    3227            �           2606    20145 6   acceleratorprojects acceleratorprojects_projectid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acceleratorprojects
    ADD CONSTRAINT acceleratorprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.acceleratorprojects DROP CONSTRAINT acceleratorprojects_projectid_fkey;
       public          postgres    false    217    219    3229            �           2606    20168    cities cities_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid);
 F   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_countryid_fkey;
       public          postgres    false    223    221    3233            �           2606    20181    hotels hotels_cityid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_cityid_fkey;
       public          postgres    false    3235    223    225            �           2606    20195 $   researches researches_projectid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.researches
    ADD CONSTRAINT researches_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.researches DROP CONSTRAINT researches_projectid_fkey;
       public          postgres    false    227    3229    217            �           2606    20210 "   scientists scientists_country_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_country_fkey FOREIGN KEY (country) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_country_fkey;
       public          postgres    false    221    3233    229            �           2606    20215 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    229    3237    225            �           2606    20230 5   scientistsresearch scientistsresearch_researchid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scientistsresearch
    ADD CONSTRAINT scientistsresearch_researchid_fkey FOREIGN KEY (researchid) REFERENCES public.researches(researchid) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.scientistsresearch DROP CONSTRAINT scientistsresearch_researchid_fkey;
       public          postgres    false    230    227    3239            �           2606    20225 6   scientistsresearch scientistsresearch_scientistid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scientistsresearch
    ADD CONSTRAINT scientistsresearch_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(scientistid) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.scientistsresearch DROP CONSTRAINT scientistsresearch_scientistid_fkey;
       public          postgres    false    229    3241    230            H   u   x���A��`\#͹I8����@� k�DG���Ug�LM�����~x����zݰ/G[�o�x������������uJ>��g~H��4b-�b���d�lMdV�L~��-�      D   u   x��I�0е�aP��.l��UM�$�����|-�%a���AG���nѓd���z�3%qA���H��fU?`"��rh�#f���8����Abd?c%��;j�چla�9E��+� ?D*%      L   �   x�%�AN�@E׿N�	0KM4�Y�qSh!ݦa�\Hc<�պ���^�28�:����t��(�>�n�((�ݔ�$�x��
<�]���i�#��q�I�p��gv-^�Q��"��v���� �"!�[D�dR}�l?��'��&��V���帞�]���P�~׷�!��ü��Sb���?9�r��
7���Z�k<���M۸i����,�,E�ۉ[����9v}�"�_��V=      J   �   x���N1k�a��/�K�t�
j��E�蔕�G�ӓ��o<�����G�~� �L�@%�����{�w`1EU�0rφ��u�����U1��D�H���gQgV.�aUshғ9���k�J����qlm��.Ց$���㶏~^�1��o�5�'����6n���D*�J�s�2{_"X�$�L�΄EX_�}1C�})�f���SJ��RAJ      N   �  x�US�n�@|��
��b*����ƭ�&�#E��r�s帳��~}�#MT		������J�1�}��jwV�gO�����nM�l|����L9I�=j>*{�E(���#��V�v$K<���uU������TCi��B��s��+�Ap>�ƶA�,�l���ZW�_�BrQ�%�}q�?}4|	�{}:iK)0R����h�[��(i=�-{ի ߻Qd�os!z|������"�$��BJ�`���Yt=x�*�s�'L�eB��Q������%R���jg�Y]����:=M1&���ݹk�,�m˯���` #xA���Aj�B���*8��g��7ﯕg��b!0�����s�p��
��e!�-/i;`��h���$ߩ��&�5_�|�*�xk\ո�f���n,|�]{¦B�E�ڀJK����LW�W��z�sD12��4�����H퍞귆���i��u�d���m;~y1����a�	���hcL@<8�/c��tA����:�Y��Kt6F�vL��ڙ��0����]U��q�z��XU�'f����֝�|��U����;�"�k���L)���,�j�mP�O��v��}�p�v�
2� �!��Z�C�S�m0�\dsXj4|f�?��d����3�Ҝ��`s��'�[�EV����t�i:�Rd%}�5�p��L����by��"O���Fy5Ex:�_��cVB      F   Y  x�%��n�@�����'�2���%J�D �Z�7.�lF���@"ҧ�a{g��G�9�$��|�����4X�[ȳc���J��m��#�<R�^ub��O�:�2�w����	�e�@�=>C����SǸ���ڬ۷E��-�g�F��2{�����?�*C���k��˞�Q�4_wg�Yu�[�A�@��[(���eV���ب�7�~�����%��^.��������.��V� ��Ǩ�a����*ʲ��RuE���,�
����]�$��N�c�I�jBTįB���9'6�h��&H�z����&�� �"@������l�W��V0�����-k�����`��"��=�k      P   �	  x��X�r�H<7��?@��'^7����%	�D�X��� $"$� ����U e�k�a#��hvweefe[��f�����4�ga�0^�$��*��Jj��$u:0b�M.?��A��k�r�u���uޗ�
��Q���B�u�L�M`ż鎥��U'FXeԵJ�P�8565:pbZW�m�?�A��ۮ)vu�U�R8��
��k����K>�b���n����i:�\��(���Թ Sڨy9�塩���h���T"5*���HL����աiw�Ah#<�a�&���*��SW�X� ���Z�R����� A9M�U��X	���ZyK;�X���ݡ2?l�ME��y)�U��ڊ���1�` ��F�?����/��k��Z4?&\��Q�N-�Y�h���>�+��nDE��.L�	����l};]d�z�� �祎R�RڋiE���K��
C��b��E��ɡ�O�zvw{�-��l:Ye�͌o�G$�kI�6I}�Hl�>?T�=pl^  c�X
��?���җcn["U���F��M���m��%A���8�K0~����e�5u�?A}���X`R�]`���֓�ە��nn?-�̿G�Q 
4���/HU�쐸7�s�L��	_������Rֲ쟚,��i-�W���šϩ��V��YUH ��&��DO���Q��| d��+��+9�����?8eΟ��Л�tR�TtD*`� ���uӞ���+�z��u�m`B�͡�������8v��C��z@����o����h�U����(1��r6Y�c4#t$!B�k1��,7�c�M&�iOr�e4]UvG�Qa`�?}m��O���
�m�I^ԙA����ֈ���h�U�!Gj��Ԥo*�ZQ>U����L;s)�X�J�D��M�������V)�.@�oT�۰�XV]���-7�
K�	�O�)h)��H,�O�p����x�@9����_��_4%l^m��xw�>��@�� ��$�hw�n+�UT�p3��I��{L�m�ɻ�����R�r혞���Xl��/;��U_�5#���݉�T2~`l��x.��+��!)ᲆ�c)9t=
��p��z���۲��6ԔKm�|h�W�K΋�d���w��l1{����!
@���.	�p��	R=�W2+��0���`��4�[z&&�ȳ��fG� ��ͩ��]~%?tg\�>�Pv_ʮ:�׻L�o^h\_�I�-'�QD,�hv4��`�6��J�b��Kıْ�?�x"���ٷu�"b��{+nU��Gt]���{�a�zĐ��l��O�)2�nn/�~~���X��T�b���ݟu�-�ryz���z2�X�S�h�">&�{� �/�6�w���[�o�9�4Qn�,�N�eײC�d��a���Hf�G�-������/���˩?*
r�A�@|��8FQ��#o�$�y]gN~c�bV��J^0xheY]�J���:ޜ��\U4��E]m�"��W
���ԑ��y�Ϻ�'���ֱ�0z�����$��M|#.����9�B���b:�%6<��e��"Cޠ�'~��e��t V.��WG�%�d�XR�%����� R@�Xy!dj6{�ٟ��&��41~�@�'LR���}��7Ӽ=��*R�a�YI�	�0����LV�ys�}F�W,�U���������9u�o�������o�/y''_y��H>&b33�ff�2����}s@�;!������FV$�x��L��!TQL�9ې�q��̾��c6bG��T&�:���H�I�/ ]�c����U��)P%A��7��Ph2�R<><2�OXcW6=7������w�''�K��j�wp�qBzf�c#Í��r�Ӥ�u�sJq4P��/����҄E���\0���%��U_Մ��'�w| =kLy1���V��ŧ�.[ϳ���b�I<�8C@�d�.�H�D�c~����=�1rbRE��l&���%�0v�L(��=�1���R�fzD�Yc�D|��oF��1�Y�&FC����S���]�5$ܟ?j�7"P��N�<n"�K@پ�$%��3���,���n�5jW�W�K�i���������e�!f9���0L�9[�I����z
�A=�d�|4fbGjw����1�z��N����[k�C;q{��o��f�i����Ʈ�N������=��^�e@^q$�I��k�]��;ϒM�J@�|�so�����5�8$��d
y/���|������b����̔�����	�R!��G�~�3�#���vL� |<9�Od�ͩL���l$�?����m�>�����&���= r8������AԏHr�'�6� ��N�P3��x{7�؋7��݄kͨ��g���voF_��h�S1a��b�36�!3���)*�Xyò��\R²n���4 BI$����w�O=FT�=f8�m����z4��Jl4�(��ɉ )O�*}k(��oʶT��(H3ne�ۦ����72ѽ=��Ͽ� �C?�/      R   w
  x�uX�n�H|n~�~@���l�ŗؙĳA�`���V�(2hR��:M�օ�!�:�:Uu(؏v�v�n��k˄-윫��3��.�`w�n�}����a�X�L&�C����jc�vxh�9�s�fR-_(������7�z%�L���o��m��k<*s�&�U.${tNp�3��|\���m�b�$�|΋�3�v!�I<�lf����Z�X�y��Hy�9s�g�\(�P��>�W
�Y���w������'�ɹ�w3Q,�cƮ��"+��vx��*����l�P�q����Ƈw����Shg�A<�Ʊ���<5F�S�Hqa�����3��r��{���[�_AmQ|Ƌ�4q�0gBfx}}ӳ[ף;�����sigB.����T�4Oms�ыL .���]n��k���˂�*13�Z��eЉ[߰۪
�asI�y9�8����3��=�sz�h�V��9!���Y�-e&4�w (z�����MX���������c��e�p�����Y���T5!i.e�E�@vc��>
"tԵc_C]EC�����������9�fW�}��m"m�o��Я�V  쭋��u��"�3����z�y���K��FtD�݄��e_\Ӏ&�@N[��p�S��8L����Ǖ�Jg�~�$F�j�
�E�55�4#طP�~�nܮ����͐}N�k�m����� �%B��ny��w�Z�R�8G[z}�˒�����7��^m\h��o���7 �S-#�}��e?ܦD�^�'�(�f@C9����$�Ɇαo�~�h^PX��X�y�D���R��f���r�a!�i&�X�s>��P��uձo��o_���I�\�g�ɪL���܊]��;L�fCd�g�ȇ�ub���RZv+ �}PAۈje�A���H|�8��m6�&XǶ7�P�B�p)>x� `����c�ߩ�$���ԗ)�ni@��w}O����sb.0��z��a����#Qp���â$��K�g��4Y�x�CD��@�ޢK6i4�V뜿-h����>D�����@�9=�V�`���O��x��su0ϔ6^J��S4!O�d�7���4�
��e�N����Xz��t�4�Jv��ݹU��KjmHΔ��#%v.���'�s���(�a[�c�T�棳@�I�JN�*�&�k;�lT��ʿ@���\א{2<M���@C�!��>��EZ���}D�H(�XY$VJN(�|���L+v�v�}�ͨ_��;�D�iN�p�ipR�D`Cݱ�RX��''�?�׆}v�Ʋl����v�?�<%��sv�rM���3(b��Gv))6d�ru�@K��l\��\���$b hM2C'�Mt�ip��ưD��nS�d�Js��B�s��cʟjb�K�H��|t$ ^%'mE�]0��z��4�eۮG��K�X��83�&�hj*�=��8�撧���w�93��ێ]m��s�U&�+��רS<��~�u� �ϫ����CXN�4F��`�AP$��6����R�1�"[�儁1b��>4+��O�ʛ.��^������&�"39�~A��Z����d��'D�
��϶~b7qKh�*"T/6G��T����~bo��*!��t��,��	"zcٗ�B��S\��z,�x$��|�1�场��v;8�8Ge�al)���6�"��Dۊ(�����EZqh����<V.���n��:"R%L�]W��3����I�Uf�$���X�wF�1�ä53Ļ����BE��SUt��n�'� '�%A���>�r/!�[�a�1�M�0d���iW�>�k�U�k�N�V�%��߯���Y^���o�`��|�l-�&����zG����!n�d�jG��k�*��ۥL�8�#�E%[v��� 0M�z�v������e1A�
�Z \�6�"RmF�c� �9X��V���;q�j�~��(�au4� ��';����r;��7���dM�3;�|%�e1٤��;���[f����IA�	zAwP�v@b차�.>������H��+��&� ����$k�ƻ/,:��˽������!l��C�RP:n��@[�� D�G���V.�@"O_'ҥpaI��(�� �Bn��ݽ�r
;�SJ��|mRt��ݥJ��$ߝ��d��J�np�7�w���%f�n�*��x�怒]��Ю�������l,�Xl�R)a{�)A�+7���Oy� (�b��zO�V�]�.��������A�|�I{Zj�%����=�ON��ɚ��d�J ɇ'v��6m�(�[��H|D=no��9�a�`�����V$�x�lN�
x��f��H\/��r5*��&�1�zb�˒\�pg�7�hb#ҩ$�zJ�U�т���rն� X*��g��Or��Z>P/�w��2=oQ��w5F�V$��>G��`=Ĩ�xEǢ�������@z�^�g�DG%uG.��������)�$���M�鮦�aH��XҶw�Cc�d���dC�i�&3k(��}�>&}%"�B���?x��>>��GT:�,�̖<����w[ �����wh�Є��c1vdr�1WBmIBZ�Q� T�AGI-i!Z��5�dITfa�6�?>�=tc�%YI��L�~�L�'���,���t2���LNt���XA
��-˲� �1l      S   8  x��ɑ�0�33ev���?����raI,z6�O]�5�WK��%VG�����d�}bߧf�沫R����X���ȄړD|eR��-u�mu��'�"�b�^�����>R�<yx_y��I���{��i�DJ�F1W���I��5k~<=M
͹8"!�4�K�vf����Ȫ�b��qa!ij9�
F$�]�.��ϭl�VJ�cm������zC����ז���8�^6���X��oƓ�a��t��g�}:��1˓��Ҟq�����D3~���{�z�Hc��ۻg����nr�[�-� L�>f�e�2�U;�����K=�$����JQƳd4�u���P,�42*2�����#��Ɉ�Т� #�'� �S���
*���1*�GEo�GB$�Q$Q�ǯtTtt����l��̳E(	���r�B��E�e�]	-�{]�@�DĿ���QT�(�S���#��L*�������ȉhQa+�!b(���E���^(�_Eq�����}N�r*{�(��0�/rꡠM
bF�E��Z��ߟ���w��     