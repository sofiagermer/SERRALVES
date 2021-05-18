PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    NIF             INTEGER PRIMARY KEY CONSTRAINT CheckLengthNIF CHECK (length(NIF) == 9),
    Nome            TEXT NOT NULL,
    Morada          TEXT NOT NULL,
    CPostal         TEXT CONSTRAINT CheckPessoaCPostal CHECK (CPostal LIKE '____-___') NOT NULL,
    DataNascimento  DATE NOT NULL,
    Telemovel       TEXT UNIQUE CONSTRAINT CheckPessoaTelemovel CHECK (length(Telemovel) == 9) NOT NULL,
    Email           TEXT UNIQUE CONSTRAINT CheckPessoaEmail CHECK (Email LIKE '%@%.%_') NOT NULL
);

DROP TABLE IF EXISTS Staff;

CREATE TABLE Staff (
    NIF             PRIMARY KEY CONSTRAINT FKStaffPessoa REFERENCES Pessoa(NIF) ON DELETE CASCADE
                                                                                ON UPDATE CASCADE,
    NISS            TEXT UNIQUE CONSTRAINT CheckLengthNIF CHECK (length(NISS) == 11) NOT NULL,
    Salario         INTEGER NOT NULL
);

DROP TABLE IF EXISTS Exposicao;

CREATE TABLE Exposicao (

    IDExposicao     INTEGER PRIMARY KEY,
    Nome            TEXT NOT NULL,
    Descricao       TEXT NOT NULL,
    Inicio          DATE NOT NULL,
    Fim             DATE CONSTRAINT ExposicaoCheckDatas CHECK  (Fim > Inicio OR Fim IS NULL),
    NIF             INTEGER CONSTRAINT FKEsposicaoCurador REFERENCES Staff(NIF) ON DELETE CASCADE
                                                                                ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Espaco;

CREATE TABLE Espaco (
    IDEspaco        INTEGER PRIMARY KEY,
    Nome            VALCHAR UNIQUE NOT NULL,
    Interior        BOOLEAN DEFAULT true
);

DROP TABLE IF EXISTS Artista;

CREATE TABLE Artista (
    IDArtista       INTEGER PRIMARY KEY,
    Nome            TEXT NOT NULL,
    DataNascimento  DATE,
    DataFalecimento DATE CONSTRAINT ArtistaFalecimento CHECK (DataFalecimento > DataNascimento OR DataFalecimento IS NULL),
    Nacionalidade   TEXT,
    Biografia       TEXT
);

DROP TABLE IF EXISTS Obra;

CREATE TABLE Obra (

    IDObra          INTEGER PRIMARY KEY,
    Nome            TEXT,
    Ano             INTEGER,
    Descricao       TEXT,
    IDExposicao     INTEGER CONSTRAINT FKObraExposicao REFERENCES Exposicao(IDExposicao) ON DELETE CASCADE
                                                                                         ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Filme;

CREATE TABLE Filme (
    IDObra          PRIMARY KEY CONSTRAINT FKFilmeObra REFERENCES Obra ON DELETE CASCADE
                                                                   ON UPDATE CASCADE,
    Duracao         REAL NOT NULL CONSTRAINT FilmeDuracao CHECK (Duracao > 0),
    Genero          TEXT,
    Idioma          TEXT
);

DROP TABLE IF EXISTS Fotografia;

CREATE TABLE Fotografia (
    IDObra          PRIMARY KEY CONSTRAINT FKFotografiaObra REFERENCES Obra ON DELETE CASCADE
                                                                        ON UPDATE CASCADE,
    Altura          REAL NOT NULL CONSTRAINT CheckFotografiaAltura CHECK (Altura > 0),
    Largura         REAL NOT NULL CONSTRAINT CheckFotografiaLargura CHECK (Largura > 0),
    Digital         BOOLEAN
);

DROP TABLE IF EXISTS Pintura;

CREATE TABLE Pintura (
    IDObra          PRIMARY KEY CONSTRAINT FKPinturaObra REFERENCES Obra ON DELETE CASCADE
                                                                ON UPDATE CASCADE,
    EstiloArtistico TEXT,
    Altura          REAL NOT NULL CONSTRAINT CheckPinturaAltura CHECK (Altura > 0),
    Largura         REAL NOT NULL CONSTRAINT CheckPinturaLargura CHECK (Largura > 0),
    Cuidados        TEXT
);

DROP TABLE IF EXISTS Escultura;

CREATE TABLE Escultura (
    IDObra          PRIMARY KEY CONSTRAINT FKEsculturaObra REFERENCES Obra ON DELETE CASCADE
                                                                           ON UPDATE CASCADE,
    Material        TEXT,
    Altura          REAL NOT NULL CONSTRAINT CheckEsculturaAltura CHECK (Altura > 0),
    Largura         REAL NOT NULL CONSTRAINT CheckEsculturaLargura CHECK (Largura > 0),
    Peso            REAL NOT NULL CONSTRAINT CheckEsculturaPeso CHECK (Peso > 0)
    
);

DROP TABLE IF EXISTS Bilhete;

CREATE TABLE Bilhete (
    IDBilhete       INTEGER PRIMARY KEY,
    Desconto        REAL CONSTRAINT CheckBilheteDesconto CHECK ((Desconto>0.0 AND Desconto<=1.0) OR Desconto IS NULL) 
    /*Valor final calculado por triggers*/
);


DROP TABLE IF EXISTS Fatura;

CREATE TABLE Fatura (
    IDFatura        INTEGER PRIMARY KEY,
    Valor           INTEGER NOT NULL,
    IDStaff         INTEGER NOT NULL CONSTRAINT FKFaturaStaff REFERENCES Staff (NIF) ON DELETE CASCADE
                                                                                     ON UPDATE CASCADE
); 

DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra (
    IDFatura        INTEGER CONSTRAINT FKCompraFatura REFERENCES Fatura (IDFatura) ON DELETE CASCADE,
    NIF             INTEGER CONSTRAINT FKCompraPessoa REFERENCES Pessoa(NIF),
    IDBilhete       INTEGER CONSTRAINT FKCompraBilhete REFERENCES Bilhete (IDBilhete) ON DELETE CASCADE,
    PRIMARY KEY (IDFatura, IDBilhete)
);

DROP TABLE IF EXISTS Amigo;

CREATE TABLE Amigo (
    NIF             INTEGER PRIMARY KEY CONSTRAINT FKAmigoPessoa REFERENCES Pessoa (NIF) ON DELETE CASCADE
                                                                                         ON UPDATE CASCADE,
    NIB             TEXT UNIQUE,
    IDTipoAmigo     INTEGER CONSTRAINT FKAmigoTipoAmigo REFERENCES TipoAmigo(IDTipoAmigo) ON DELETE CASCADE
                                                                                          ON UPDATE CASCADE
);

DROP TABLE IF EXISTS TipoAmigo;

CREATE TABLE TipoAmigo (
    IDTipoAmigo     INTEGER PRIMARY KEY,
    Nome            TEXT NOT NULL UNIQUE,
    Preco           INTEGER NOT NULL CONSTRAINT TipoAmigoPreco CHECK (Preco > 0)
);


DROP TABLE IF EXISTS Vigilante;

CREATE TABLE Vigilante(
    NIF             INTEGER CONSTRAINT FKVigilanteStaff REFERENCES Staff (NIF) ON DELETE CASCADE
                                                                               ON UPDATE CASCADE,
    IDObra          INTEGER CONSTRAINT FKVigilanteObra REFERENCES Obra (IDObra) ON DELETE CASCADE
                                                                                ON UPDATE CASCADE,
    PRIMARY KEY (
        NIF,
        IDObra
    )
);

DROP TABLE IF EXISTS Seguranca;

CREATE TABLE Seguranca(
    NIF             INTEGER CONSTRAINT FKSegurancaStaff REFERENCES Staff (NIF) ON DELETE CASCADE
                                                                               ON UPDATE CASCADE,
    IDEspaco        INTEGER CONSTRAINT FKSegurancaEspaco REFERENCES Espaco (IDEspaco) ON DELETE CASCADE
                                                                                      ON UPDATE CASCADE,
    PRIMARY KEY (
        NIF,
        IDEspaco
    )
);

DROP TABLE IF EXISTS Horario;

CREATE TABLE Horario(
    IDHorario       INTEGER PRIMARY KEY,
    HoraEntrada     TIME NOT NULL,
    HoraSaida       TIME NOT NULL CONSTRAINT HorarioHoraSaidaMaiorEntrada CHECK (HoraSaida>HoraEntrada)
);


DROP TABLE IF EXISTS TipoBilhete;

CREATE TABLE TipoBilhete (
    Nome            TEXT NOT NULL,
    Preco           INTEGER NOT NULL, 
    IDEspaco        INTEGER CONSTRAINT FKTipoBilheteEspaco REFERENCES Espaco(IDEspaco) ON DELETE CASCADE
                                                                                       ON UPDATE CASCADE,
    IDBilhete       INTEGER CONSTRAINT FKTipoBilheteBilhete REFERENCES Bilhete(IDBilhete) ON DELETE CASCADE
                                                                                          ON UPDATE CASCADE,
    PRIMARY KEY (
        IDEspaco,
        IDBilhete
    )
);

DROP TABLE IF EXISTS ExposicaoEspaco;

CREATE TABLE ExposicaoEspaco(
    IDExposicao     INTEGER CONSTRAINT FKExposicaoEspacoExposicao REFERENCES Exposicao (IDExposicao) ON DELETE CASCADE
                                                                                                     ON UPDATE CASCADE,
    IDEspaco        INTEGER CONSTRAINT FKExposicaoEspacoEspaco REFERENCES Espaco (IDEspaco) ON DELETE CASCADE
                                                                                            ON UPDATE CASCADE,
    PRIMARY KEY (
        IDExposicao,
        IDEspaco
    )
);

DROP TABLE IF EXISTS ObraArtista;

CREATE TABLE ObraArtista(
    IDObra          INTEGER CONSTRAINT FKObraArtistaObra REFERENCES Obra (IDObra) ON DELETE CASCADE
                                                                                  ON UPDATE CASCADE,
    IDArtista       INTEGER CONSTRAINT FKObraArtistaArtista REFERENCES Artista (IDArtista) ON DELETE CASCADE
                                                                                           ON UPDATE CASCADE,
    PRIMARY KEY (
        IDObra,
        IDArtista
    )
);

DROP TABLE IF EXISTS HorarioStaff;

CREATE TABLE HorarioStaff(
    IDHorario       INTEGER CONSTRAINT FKHorarioStaffHorario REFERENCES Horario (IDHorario) ON DELETE CASCADE
                                                                                            ON UPDATE CASCADE,
    NIF             INTEGER CONSTRAINT FKHorarioStaffStaff REFERENCES Staff (NIF) ON DELETE CASCADE
                                                                                  ON UPDATE CASCADE,                                                                                        
    PRIMARY KEY (
        IDHorario,
        NIF
    )
);

