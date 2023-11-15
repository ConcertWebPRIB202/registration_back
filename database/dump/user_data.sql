PGDMP  )    !            
    {         	   user_data    16.0    16.0 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399 	   user_data    DATABASE     }   CREATE DATABASE user_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE user_data;
                postgres    false            �            1259    16453    documents_storage    TABLE     l   CREATE TABLE public.documents_storage (
    id integer NOT NULL,
    doc_path character varying NOT NULL
);
 %   DROP TABLE public.documents_storage;
       public         heap    postgres    false            �            1259    16452    documents_storage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.documents_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.documents_storage_id_seq;
       public          postgres    false    218                       0    0    documents_storage_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.documents_storage_id_seq OWNED BY public.documents_storage.id;
          public          postgres    false    217            �            1259    16446    gender_type    TABLE     h   CREATE TABLE public.gender_type (
    id integer NOT NULL,
    gender character varying(10) NOT NULL
);
    DROP TABLE public.gender_type;
       public         heap    postgres    false            �            1259    16445    gender_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gender_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.gender_type_id_seq;
       public          postgres    false    216                       0    0    gender_type_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.gender_type_id_seq OWNED BY public.gender_type.id;
          public          postgres    false    215            �            1259    16471    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    phone character varying(50) NOT NULL,
    city character varying NOT NULL,
    gender_id integer,
    document_id integer,
    account_id integer
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16462    user_account    TABLE     �   CREATE TABLE public.user_account (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL
);
     DROP TABLE public.user_account;
       public         heap    postgres    false            �            1259    16461    user_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_account_id_seq;
       public          postgres    false    220                       0    0    user_account_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;
          public          postgres    false    219            �            1259    16470    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    222                       0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    221            `           2604    16456    documents_storage id    DEFAULT     |   ALTER TABLE ONLY public.documents_storage ALTER COLUMN id SET DEFAULT nextval('public.documents_storage_id_seq'::regclass);
 C   ALTER TABLE public.documents_storage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            _           2604    16449    gender_type id    DEFAULT     p   ALTER TABLE ONLY public.gender_type ALTER COLUMN id SET DEFAULT nextval('public.gender_type_id_seq'::regclass);
 =   ALTER TABLE public.gender_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            b           2604    16474    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            a           2604    16465    user_account id    DEFAULT     r   ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);
 >   ALTER TABLE public.user_account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220                      0    16453    documents_storage 
   TABLE DATA           9   COPY public.documents_storage (id, doc_path) FROM stdin;
    public          postgres    false    218   �)                 0    16446    gender_type 
   TABLE DATA           1   COPY public.gender_type (id, gender) FROM stdin;
    public          postgres    false    216   *       
          0    16471    user 
   TABLE DATA           U   COPY public."user" (id, phone, city, gender_id, document_id, account_id) FROM stdin;
    public          postgres    false    222   E*                 0    16462    user_account 
   TABLE DATA           B   COPY public.user_account (id, login, password, email) FROM stdin;
    public          postgres    false    220   b*                  0    0    documents_storage_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.documents_storage_id_seq', 1, false);
          public          postgres    false    217                       0    0    gender_type_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.gender_type_id_seq', 1, false);
          public          postgres    false    215                       0    0    user_account_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_account_id_seq', 2, true);
          public          postgres    false    219                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    221            f           2606    16460 (   documents_storage documents_storage_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.documents_storage
    ADD CONSTRAINT documents_storage_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.documents_storage DROP CONSTRAINT documents_storage_pkey;
       public            postgres    false    218            d           2606    16451    gender_type gender_type_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.gender_type
    ADD CONSTRAINT gender_type_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.gender_type DROP CONSTRAINT gender_type_pkey;
       public            postgres    false    216            j           2606    16484    user user_account_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_account_id_key UNIQUE (account_id);
 D   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_account_id_key;
       public            postgres    false    222            h           2606    16469    user_account user_account_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_account DROP CONSTRAINT user_account_pkey;
       public            postgres    false    220            l           2606    16482    user user_document_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_document_id_key UNIQUE (document_id);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_document_id_key;
       public            postgres    false    222            n           2606    16480    user user_gender_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_gender_id_key UNIQUE (gender_id);
 C   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_gender_id_key;
       public            postgres    false    222            p           2606    16478    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    222            q           2606    16495    user user_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.user_account(id);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_account_id_fkey;
       public          postgres    false    222    4712    220            r           2606    16490    user user_document_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_document_id_fkey FOREIGN KEY (document_id) REFERENCES public.documents_storage(id);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_document_id_fkey;
       public          postgres    false    4710    218    222            s           2606    16485    user user_gender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.gender_type(id);
 D   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_gender_id_fkey;
       public          postgres    false    4708    222    216                  x������ � �            x�3��M�I�2�LK3b���� >�9      
      x������ � �            x������ � �     