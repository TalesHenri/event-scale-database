--
-- PostgreSQL database dump
--

\restrict HSY8I0mr6NnynQ89s0b1FQNd4WdfYE3FYkfssWBhbLkrstVdzLj8BaHcSnbK4pR

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-15 18:08:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 16808)
-- Name: alocacao_escala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alocacao_escala (
    id bigint NOT NULL,
    escala_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    posto_id bigint NOT NULL,
    medium_referencia_id bigint,
    status character varying(20) DEFAULT 'ATIVO'::character varying NOT NULL,
    observacao text,
    CONSTRAINT ck_alocacao_status CHECK (((status)::text = ANY ((ARRAY['ATIVO'::character varying, 'SUBSTITUIDO'::character varying, 'CANCELADO'::character varying])::text[])))
);


ALTER TABLE public.alocacao_escala OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16807)
-- Name: alocacao_escala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alocacao_escala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alocacao_escala_id_seq OWNER TO postgres;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 231
-- Name: alocacao_escala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alocacao_escala_id_seq OWNED BY public.alocacao_escala.id;


--
-- TOC entry 228 (class 1259 OID 16759)
-- Name: escala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.escala (
    id bigint NOT NULL,
    gira_id bigint NOT NULL,
    versao integer DEFAULT 1 NOT NULL,
    status character varying(20) DEFAULT 'EM_EDICAO'::character varying NOT NULL,
    gerada_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    confirmada_em timestamp without time zone,
    confirmada_por character varying(100),
    observacao text,
    CONSTRAINT ck_escala_status CHECK (((status)::text = ANY ((ARRAY['EM_EDICAO'::character varying, 'CONFIRMADA'::character varying, 'CANCELADA'::character varying])::text[])))
);


ALTER TABLE public.escala OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16758)
-- Name: escala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.escala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.escala_id_seq OWNER TO postgres;

--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 227
-- Name: escala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.escala_id_seq OWNED BY public.escala.id;


--
-- TOC entry 226 (class 1259 OID 16734)
-- Name: gira; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gira (
    id bigint NOT NULL,
    data_gira date NOT NULL,
    tipo_gira character varying(30) DEFAULT 'GIRA NORMAL'::character varying NOT NULL,
    observacao text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(20) DEFAULT 'ABERTA'::character varying NOT NULL
);


ALTER TABLE public.gira OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16733)
-- Name: gira_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gira_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gira_id_seq OWNER TO postgres;

--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 225
-- Name: gira_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gira_id_seq OWNED BY public.gira.id;


--
-- TOC entry 240 (class 1259 OID 16948)
-- Name: notificacao_envio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificacao_envio (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    gira_id bigint,
    escala_id bigint,
    telefone character varying(20) NOT NULL,
    mensagem text NOT NULL,
    status_envio character varying(20) NOT NULL,
    tentativa integer DEFAULT 1 NOT NULL,
    resposta_api text,
    enviado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_status_envio CHECK (((status_envio)::text = ANY ((ARRAY['PENDENTE'::character varying, 'ENVIADO'::character varying, 'ERRO'::character varying])::text[])))
);


ALTER TABLE public.notificacao_envio OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16947)
-- Name: notificacao_envio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificacao_envio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificacao_envio_id_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 239
-- Name: notificacao_envio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificacao_envio_id_seq OWNED BY public.notificacao_envio.id;


--
-- TOC entry 222 (class 1259 OID 16699)
-- Name: papel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.papel (
    id bigint NOT NULL,
    nome character varying(50) NOT NULL,
    descricao text
);


ALTER TABLE public.papel OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16698)
-- Name: papel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.papel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.papel_id_seq OWNER TO postgres;

--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 221
-- Name: papel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.papel_id_seq OWNED BY public.papel.id;


--
-- TOC entry 220 (class 1259 OID 16680)
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    telefone character varying(20),
    ativo boolean DEFAULT true NOT NULL,
    pode_sala_criancas boolean DEFAULT true NOT NULL,
    observacao text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16679)
-- Name: pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pessoa_id_seq OWNER TO postgres;

--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 219
-- Name: pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_id_seq OWNED BY public.pessoa.id;


--
-- TOC entry 224 (class 1259 OID 16712)
-- Name: pessoa_papel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa_papel (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    papel_id bigint NOT NULL
);


ALTER TABLE public.pessoa_papel OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16711)
-- Name: pessoa_papel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_papel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pessoa_papel_id_seq OWNER TO postgres;

--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 223
-- Name: pessoa_papel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_papel_id_seq OWNED BY public.pessoa_papel.id;


--
-- TOC entry 230 (class 1259 OID 16795)
-- Name: posto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posto (
    id bigint NOT NULL,
    nome character varying(80) NOT NULL,
    descricao text
);


ALTER TABLE public.posto OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16794)
-- Name: posto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posto_id_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 229
-- Name: posto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posto_id_seq OWNED BY public.posto.id;


--
-- TOC entry 236 (class 1259 OID 16888)
-- Name: presenca_gira; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presenca_gira (
    id bigint NOT NULL,
    gira_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    status_presenca character varying(20) NOT NULL,
    justificativa text,
    registrada_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_status_presenca CHECK (((status_presenca)::text = ANY ((ARRAY['PRESENTE'::character varying, 'FALTOU'::character varying])::text[])))
);


ALTER TABLE public.presenca_gira OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16887)
-- Name: presenca_gira_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presenca_gira_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presenca_gira_id_seq OWNER TO postgres;

--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 235
-- Name: presenca_gira_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presenca_gira_id_seq OWNED BY public.presenca_gira.id;


--
-- TOC entry 238 (class 1259 OID 16917)
-- Name: substituicao_escala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.substituicao_escala (
    id bigint NOT NULL,
    escala_id bigint NOT NULL,
    pessoa_saida_id bigint NOT NULL,
    pessoa_entrada_id bigint NOT NULL,
    motivo text,
    registrada_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_substituicao_pessoas_diferentes CHECK ((pessoa_saida_id <> pessoa_entrada_id))
);


ALTER TABLE public.substituicao_escala OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16916)
-- Name: substituicao_escala_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.substituicao_escala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.substituicao_escala_id_seq OWNER TO postgres;

--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 237
-- Name: substituicao_escala_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.substituicao_escala_id_seq OWNED BY public.substituicao_escala.id;


--
-- TOC entry 234 (class 1259 OID 16861)
-- Name: vinculo_pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vinculo_pessoa (
    id bigint NOT NULL,
    pessoa_origem_id bigint NOT NULL,
    pessoa_destino_id bigint NOT NULL,
    tipo_vinculo character varying(40) NOT NULL,
    obrigatorio boolean DEFAULT true NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_tipo_vinculo CHECK (((tipo_vinculo)::text = ANY (ARRAY[('CAMBONE_MEDIUM'::character varying)::text, ('CAMBONE_EXP_INEXP'::character varying)::text])))
);


ALTER TABLE public.vinculo_pessoa OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16860)
-- Name: vinculo_pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vinculo_pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vinculo_pessoa_id_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 233
-- Name: vinculo_pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vinculo_pessoa_id_seq OWNED BY public.vinculo_pessoa.id;


--
-- TOC entry 4922 (class 2604 OID 16811)
-- Name: alocacao_escala id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala ALTER COLUMN id SET DEFAULT nextval('public.alocacao_escala_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16762)
-- Name: escala id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escala ALTER COLUMN id SET DEFAULT nextval('public.escala_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16737)
-- Name: gira id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gira ALTER COLUMN id SET DEFAULT nextval('public.gira_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 16951)
-- Name: notificacao_envio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacao_envio ALTER COLUMN id SET DEFAULT nextval('public.notificacao_envio_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16702)
-- Name: papel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.papel ALTER COLUMN id SET DEFAULT nextval('public.papel_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 16683)
-- Name: pessoa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN id SET DEFAULT nextval('public.pessoa_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16715)
-- Name: pessoa_papel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_papel ALTER COLUMN id SET DEFAULT nextval('public.pessoa_papel_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16798)
-- Name: posto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posto ALTER COLUMN id SET DEFAULT nextval('public.posto_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 16891)
-- Name: presenca_gira id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenca_gira ALTER COLUMN id SET DEFAULT nextval('public.presenca_gira_id_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 16920)
-- Name: substituicao_escala id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substituicao_escala ALTER COLUMN id SET DEFAULT nextval('public.substituicao_escala_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 16864)
-- Name: vinculo_pessoa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_pessoa ALTER COLUMN id SET DEFAULT nextval('public.vinculo_pessoa_id_seq'::regclass);


--
-- TOC entry 4961 (class 2606 OID 16822)
-- Name: alocacao_escala alocacao_escala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala
    ADD CONSTRAINT alocacao_escala_pkey PRIMARY KEY (id);


--
-- TOC entry 4955 (class 2606 OID 16775)
-- Name: escala escala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escala
    ADD CONSTRAINT escala_pkey PRIMARY KEY (id);


--
-- TOC entry 4951 (class 2606 OID 16749)
-- Name: gira gira_data_gira_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gira
    ADD CONSTRAINT gira_data_gira_key UNIQUE (data_gira);


--
-- TOC entry 4953 (class 2606 OID 16747)
-- Name: gira gira_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gira
    ADD CONSTRAINT gira_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 16965)
-- Name: notificacao_envio notificacao_envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacao_envio
    ADD CONSTRAINT notificacao_envio_pkey PRIMARY KEY (id);


--
-- TOC entry 4943 (class 2606 OID 16710)
-- Name: papel papel_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.papel
    ADD CONSTRAINT papel_nome_key UNIQUE (nome);


--
-- TOC entry 4945 (class 2606 OID 16708)
-- Name: papel papel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.papel
    ADD CONSTRAINT papel_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 16720)
-- Name: pessoa_papel pessoa_papel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_papel
    ADD CONSTRAINT pessoa_papel_pkey PRIMARY KEY (id);


--
-- TOC entry 4941 (class 2606 OID 16697)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 16806)
-- Name: posto posto_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posto
    ADD CONSTRAINT posto_nome_key UNIQUE (nome);


--
-- TOC entry 4959 (class 2606 OID 16804)
-- Name: posto posto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posto
    ADD CONSTRAINT posto_pkey PRIMARY KEY (id);


--
-- TOC entry 4965 (class 2606 OID 16902)
-- Name: presenca_gira presenca_gira_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenca_gira
    ADD CONSTRAINT presenca_gira_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 16931)
-- Name: substituicao_escala substituicao_escala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substituicao_escala
    ADD CONSTRAINT substituicao_escala_pkey PRIMARY KEY (id);


--
-- TOC entry 4949 (class 2606 OID 16722)
-- Name: pessoa_papel uk_pessoa_papel; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_papel
    ADD CONSTRAINT uk_pessoa_papel UNIQUE (pessoa_id, papel_id);


--
-- TOC entry 4967 (class 2606 OID 16904)
-- Name: presenca_gira uk_presenca_gira_pessoa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenca_gira
    ADD CONSTRAINT uk_presenca_gira_pessoa UNIQUE (gira_id, pessoa_id);


--
-- TOC entry 4963 (class 2606 OID 16876)
-- Name: vinculo_pessoa vinculo_pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_pessoa
    ADD CONSTRAINT vinculo_pessoa_pkey PRIMARY KEY (id);


--
-- TOC entry 4975 (class 2606 OID 16823)
-- Name: alocacao_escala fk_alocacao_escala; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala
    ADD CONSTRAINT fk_alocacao_escala FOREIGN KEY (escala_id) REFERENCES public.escala(id);


--
-- TOC entry 4976 (class 2606 OID 16838)
-- Name: alocacao_escala fk_alocacao_medium_referencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala
    ADD CONSTRAINT fk_alocacao_medium_referencia FOREIGN KEY (medium_referencia_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4977 (class 2606 OID 16828)
-- Name: alocacao_escala fk_alocacao_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala
    ADD CONSTRAINT fk_alocacao_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4978 (class 2606 OID 16833)
-- Name: alocacao_escala fk_alocacao_posto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alocacao_escala
    ADD CONSTRAINT fk_alocacao_posto FOREIGN KEY (posto_id) REFERENCES public.posto(id);


--
-- TOC entry 4974 (class 2606 OID 16776)
-- Name: escala fk_escala_gira; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escala
    ADD CONSTRAINT fk_escala_gira FOREIGN KEY (gira_id) REFERENCES public.gira(id);


--
-- TOC entry 4986 (class 2606 OID 16976)
-- Name: notificacao_envio fk_notificacao_escala; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacao_envio
    ADD CONSTRAINT fk_notificacao_escala FOREIGN KEY (escala_id) REFERENCES public.escala(id);


--
-- TOC entry 4987 (class 2606 OID 16971)
-- Name: notificacao_envio fk_notificacao_gira; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacao_envio
    ADD CONSTRAINT fk_notificacao_gira FOREIGN KEY (gira_id) REFERENCES public.gira(id);


--
-- TOC entry 4988 (class 2606 OID 16966)
-- Name: notificacao_envio fk_notificacao_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacao_envio
    ADD CONSTRAINT fk_notificacao_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4972 (class 2606 OID 16728)
-- Name: pessoa_papel fk_pessoa_papel_papel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_papel
    ADD CONSTRAINT fk_pessoa_papel_papel FOREIGN KEY (papel_id) REFERENCES public.papel(id);


--
-- TOC entry 4973 (class 2606 OID 16723)
-- Name: pessoa_papel fk_pessoa_papel_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_papel
    ADD CONSTRAINT fk_pessoa_papel_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4981 (class 2606 OID 16905)
-- Name: presenca_gira fk_presenca_gira; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenca_gira
    ADD CONSTRAINT fk_presenca_gira FOREIGN KEY (gira_id) REFERENCES public.gira(id);


--
-- TOC entry 4982 (class 2606 OID 16910)
-- Name: presenca_gira fk_presenca_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenca_gira
    ADD CONSTRAINT fk_presenca_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4983 (class 2606 OID 16942)
-- Name: substituicao_escala fk_substituicao_entrada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substituicao_escala
    ADD CONSTRAINT fk_substituicao_entrada FOREIGN KEY (pessoa_entrada_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4984 (class 2606 OID 16932)
-- Name: substituicao_escala fk_substituicao_escala; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substituicao_escala
    ADD CONSTRAINT fk_substituicao_escala FOREIGN KEY (escala_id) REFERENCES public.escala(id);


--
-- TOC entry 4985 (class 2606 OID 16937)
-- Name: substituicao_escala fk_substituicao_saida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.substituicao_escala
    ADD CONSTRAINT fk_substituicao_saida FOREIGN KEY (pessoa_saida_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4979 (class 2606 OID 16882)
-- Name: vinculo_pessoa fk_vinculo_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_pessoa
    ADD CONSTRAINT fk_vinculo_destino FOREIGN KEY (pessoa_destino_id) REFERENCES public.pessoa(id);


--
-- TOC entry 4980 (class 2606 OID 16877)
-- Name: vinculo_pessoa fk_vinculo_origem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_pessoa
    ADD CONSTRAINT fk_vinculo_origem FOREIGN KEY (pessoa_origem_id) REFERENCES public.pessoa(id);


-- Completed on 2026-03-15 18:08:07

--
-- PostgreSQL database dump complete
--

\unrestrict HSY8I0mr6NnynQ89s0b1FQNd4WdfYE3FYkfssWBhbLkrstVdzLj8BaHcSnbK4pR

