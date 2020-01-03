docker pull postgres;

docker run --name some-postgres -v /postgres/data:/var/lib/postgresql/data -d -p 5432:5432 postgres:latest


create schema test;

create table test.MusicType (
id serial NOT NULL,
name varchar NOT NULL,

CONSTRAINT pk_musicType PRIMARY KEY (id)
);

create table test.Band (
id bigserial NOT NULL,
name varchar NOT NULL,
musicType_id int NOT NULL,

CONSTRAINT pk_band PRIMARY KEY (id),
FOREIGN KEY (musicType_id) REFERENCES test.MusicType(id)
);

create table test.Concert (
id bigserial NOT NULL,
city varchar NOT NULL,
country varchar NOT NULL,
location varchar NOT NULL,
description varchar NULL,
band_id bigint NOT NULL,
date date NOT NULL,

CONSTRAINT pk_concert PRIMARY KEY (id),
FOREIGN KEY(band_id) REFERENCES test.Band(id)
);

create table test.Ticket(
id bigserial NOT NULL,
place varchar NOT NULL,
seat_number INT NULL,
concert_id bigint NOT NULL,

CONSTRAINT pk_ticket PRIMARY KEY (id),
FOREIGN KEY(concert_id) REFERENCES test.Concert(id)
);
