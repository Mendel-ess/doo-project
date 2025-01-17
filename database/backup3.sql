PGDMP     	    1                {            postgres    15.2    15.2 (    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    5    postgres    DATABASE     ~   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE postgres;
                postgres    false            5           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3380                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            6           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    24576    actores    TABLE     �   CREATE TABLE public.actores (
    actores_reparto_id integer NOT NULL,
    nombre_actor text NOT NULL,
    "Personaje" text NOT NULL,
    sexualidad integer NOT NULL
);
    DROP TABLE public.actores;
       public         heap    postgres    false            �            1259    32796    actores_peliculas    TABLE     �   CREATE TABLE public.actores_peliculas (
    id integer NOT NULL,
    peliculas_id integer NOT NULL,
    actores_id integer NOT NULL
);
 %   DROP TABLE public.actores_peliculas;
       public         heap    postgres    false            �            1259    32795    actores_peliculas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.actores_peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.actores_peliculas_id_seq;
       public          postgres    false    223            7           0    0    actores_peliculas_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.actores_peliculas_id_seq OWNED BY public.actores_peliculas.id;
          public          postgres    false    222            �            1259    24607    generos    TABLE     `   CREATE TABLE public.generos (
    movie_genres_id integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.generos;
       public         heap    postgres    false            �            1259    24602 
   genres_map    TABLE     �   CREATE TABLE public.genres_map (
    id integer NOT NULL,
    movie_title_id integer NOT NULL,
    movie_genres_id integer NOT NULL
);
    DROP TABLE public.genres_map;
       public         heap    postgres    false            �            1259    24619 	   peliculas    TABLE     �   CREATE TABLE public.peliculas (
    movie_titles_id integer NOT NULL,
    titulo text NOT NULL,
    puntuacion integer NOT NULL,
    fecha_salida date NOT NULL,
    para_adultos boolean NOT NULL
);
    DROP TABLE public.peliculas;
       public         heap    postgres    false            �            1259    24631    reviews    TABLE     �   CREATE TABLE public.reviews (
    reviews_id integer NOT NULL,
    comentarios text NOT NULL,
    rating integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_actualizacion date NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    32768 
   sexualidad    TABLE     f   CREATE TABLE public.sexualidad (
    generos_actores_id integer NOT NULL,
    genero text NOT NULL
);
    DROP TABLE public.sexualidad;
       public         heap    postgres    false            �            1259    24643    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    username "char"[] NOT NULL,
    password "char"[] NOT NULL,
    email "char"[] NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_actualizacion date NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2604    32799    actores_peliculas id    DEFAULT     |   ALTER TABLE ONLY public.actores_peliculas ALTER COLUMN id SET DEFAULT nextval('public.actores_peliculas_id_seq'::regclass);
 C   ALTER TABLE public.actores_peliculas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            &          0    24576    actores 
   TABLE DATA           \   COPY public.actores (actores_reparto_id, nombre_actor, "Personaje", sexualidad) FROM stdin;
    public          postgres    false    215   y-       .          0    32796    actores_peliculas 
   TABLE DATA           I   COPY public.actores_peliculas (id, peliculas_id, actores_id) FROM stdin;
    public          postgres    false    223   13       (          0    24607    generos 
   TABLE DATA           :   COPY public.generos (movie_genres_id, nombre) FROM stdin;
    public          postgres    false    217   �3       '          0    24602 
   genres_map 
   TABLE DATA           I   COPY public.genres_map (id, movie_title_id, movie_genres_id) FROM stdin;
    public          postgres    false    216   W4       )          0    24619 	   peliculas 
   TABLE DATA           d   COPY public.peliculas (movie_titles_id, titulo, puntuacion, fecha_salida, para_adultos) FROM stdin;
    public          postgres    false    218   t4       *          0    24631    reviews 
   TABLE DATA           g   COPY public.reviews (reviews_id, comentarios, rating, fecha_creacion, fecha_actualizacion) FROM stdin;
    public          postgres    false    219   76       ,          0    32768 
   sexualidad 
   TABLE DATA           @   COPY public.sexualidad (generos_actores_id, genero) FROM stdin;
    public          postgres    false    221   T6       +          0    24643    users 
   TABLE DATA           h   COPY public.users (user_id, username, password, email, fecha_creacion, fecha_actualizacion) FROM stdin;
    public          postgres    false    220   �6       8           0    0    actores_peliculas_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.actores_peliculas_id_seq', 1, false);
          public          postgres    false    222            �           2606    32801 (   actores_peliculas actores_peliculas_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.actores_peliculas
    ADD CONSTRAINT actores_peliculas_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.actores_peliculas DROP CONSTRAINT actores_peliculas_pkey;
       public            postgres    false    223            �           2606    24582    actores actores_reparto_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.actores
    ADD CONSTRAINT actores_reparto_pkey PRIMARY KEY (actores_reparto_id);
 F   ALTER TABLE ONLY public.actores DROP CONSTRAINT actores_reparto_pkey;
       public            postgres    false    215            �           2606    32774    sexualidad generos_actores_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.sexualidad
    ADD CONSTRAINT generos_actores_pkey PRIMARY KEY (generos_actores_id);
 I   ALTER TABLE ONLY public.sexualidad DROP CONSTRAINT generos_actores_pkey;
       public            postgres    false    221            �           2606    24606    genres_map genres_map_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.genres_map
    ADD CONSTRAINT genres_map_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.genres_map DROP CONSTRAINT genres_map_pkey;
       public            postgres    false    216            �           2606    24613    generos movie_genres_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.generos
    ADD CONSTRAINT movie_genres_pkey PRIMARY KEY (movie_genres_id);
 C   ALTER TABLE ONLY public.generos DROP CONSTRAINT movie_genres_pkey;
       public            postgres    false    217            �           2606    24625    peliculas movie_titles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT movie_titles_pkey PRIMARY KEY (movie_titles_id);
 E   ALTER TABLE ONLY public.peliculas DROP CONSTRAINT movie_titles_pkey;
       public            postgres    false    218            �           2606    24637    reviews reviews_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (reviews_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    219            �           2606    24649    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    32807    actores_peliculas FK_actores_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.actores_peliculas
    ADD CONSTRAINT "FK_actores_id" FOREIGN KEY (actores_id) REFERENCES public.actores(actores_reparto_id);
 K   ALTER TABLE ONLY public.actores_peliculas DROP CONSTRAINT "FK_actores_id";
       public          postgres    false    223    215    3204            �           2606    24672    genres_map FK_movie_genres_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.genres_map
    ADD CONSTRAINT "FK_movie_genres_id" FOREIGN KEY (movie_genres_id) REFERENCES public.generos(movie_genres_id);
 I   ALTER TABLE ONLY public.genres_map DROP CONSTRAINT "FK_movie_genres_id";
       public          postgres    false    217    216    3208            �           2606    24677    genres_map FK_movie_title_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.genres_map
    ADD CONSTRAINT "FK_movie_title_id" FOREIGN KEY (movie_title_id) REFERENCES public.peliculas(movie_titles_id);
 H   ALTER TABLE ONLY public.genres_map DROP CONSTRAINT "FK_movie_title_id";
       public          postgres    false    3210    218    216            �           2606    32802    actores_peliculas FK_peli_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.actores_peliculas
    ADD CONSTRAINT "FK_peli_id" FOREIGN KEY (peliculas_id) REFERENCES public.peliculas(movie_titles_id);
 H   ALTER TABLE ONLY public.actores_peliculas DROP CONSTRAINT "FK_peli_id";
       public          postgres    false    223    218    3210            �           2606    32790    actores FK_sexualidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.actores
    ADD CONSTRAINT "FK_sexualidad" FOREIGN KEY (sexualidad) REFERENCES public.sexualidad(generos_actores_id) NOT VALID;
 A   ALTER TABLE ONLY public.actores DROP CONSTRAINT "FK_sexualidad";
       public          postgres    false    221    215    3216            &   �  x��V�V�8]+_�e����<x��t�	=�̦b+�Yb$���������e�C3B�.���-u�B�JnKc�=Y1Q1�VW�M�s��T��`뉥�Y9�{���������v^+c�<Mrg��x�f*�vk �� �t�;qI!Ծ�bl-}Y�WJ^宠 �
Ƅ`����#-׊�Wʫ��c��IN>�S��$7�S2j�0NĜ�Tqx����`�N��K�\��X�#y�lJl�+�uC։m�"��銉6��FU֙4|Y&S�1�p̭bDO|s��5�	��bW}�TFshrH�
��A��S*�v(�X#��{����
�'7e�6���L~�cQ.˘�8E�2�c�\p����)yϽ���+J��O�C�:�b�,��%��|@���Sg�*�w�ݞ�y�}e%���Ѵ�V SED��6��J��HjNV��թQ����23���� {+�U�s�]1u^�{ѡˣ���Gl��U���{��¡ӗ�2�v��FM��Sr�.­�C�Kz`�@05S0 Ăz��]�݋w���@Vc�zu��2x��Z��d�P��w��F�P8��C7J��5E�\;�r���G�W��%y�V��=L!�5|��.�J�8�{m�q! e�i㟚����d�t�J�	��BN�x����ʦ��늅Bu�΁��D��3&Fa��bopz��|�De Y���� /x$� ���V���e�� �1ґO�sO9
������<x�X|��MP	SǴ�*����NNh�5��I&���<�ڭ~�)/R��![�7�FS=[A��;�,��ؔ!��Mȸ,��ʅ����t B�$�����6���2�m��+xcdO�
*7n�|���J����Ţ���s�!(�NBnuf9�q��i���`��ŕ���s��c���L[(݇@(M����j�39*ʨx7h��*����
�,�L�wQXn)�����ޣ<���@^�3���+�(�<C��`PK�NЊ���1le��8Ň�,�σ�9$4��F��N1!w�=8��?����\��ab�s�8N`���	W0��U���3o��jm�<wϣ>�+V�e�rPS����z�娛m�,�g��+�5��;���HS�!#P��^����'���A��1��Nc{\8�8v��:��R�,�{6��~��h�q����ñ�^��l'�� ����+˨-N߃�2�|��*d��7���'<ꈱ�)G�\�.�5�͐֖�P=l��ԓ��@�^��5/���po��">�rI? C�ݽJ�zt����K�8���-�3��Ѱ��+w���v~�s݋WF�ƺ�ij � ��+?�6�*�R^ɣc�:p���73��%��|��
��Ѯ�3\�<�D��]E~��)�w.R�>�u��Q����	�t      .   F   x�̹ 1��S�>��^�+>�&���$m�����i�n�={��
�=��UAUCUE��?�ZZ      (   �   x�-�=nBA�k���O�B4HPҤ�#Yڟh���)�^�FߌgL�:��q��Įόch�~�	�R��2Na�5H����Mu�q�́q�-�4eV�WF�VK��q"8I�)#�`W�E��1�, Y�)pt�dc*�)7}H3؋�W�{n�Ҝ>��p�ˏ�b'����t	_�,��=@��JP      '      x������ � �      )   �  x�}R���0��_�i�ɐ(ɯ��2��':�R�YX���M$��	�������C�4�� j��ٙYn�'��I~VN�D*�$-�L��H�R�dCI7�[�5��?u�}w ����$+Y��Ӫ�(-n�*�Wָ1n�II����@."yk������;�� C䔰��6��C�C�hO�g|4�1���2Is�O`��e3,3c`
UK?���:{�g������a�y�|��#�&/�Ō��W0s����H�,�k+e���z0:��A������:L��V���n�ȎX��D�G�x�?����&��D��;r��@�d� ������ן��`τ�20���1���֘�+y�:�:�t�ܨ7�����RZK���������3���e˗�k���S�a�9�J�1�]vC�ʵ�ŧ�k�{"
�i;g���h4��T��      *      x������ � �      ,   0   x�3���SH-.HM�L�LN,�2����M*J�2��-�J-����� "�      +      x������ � �     