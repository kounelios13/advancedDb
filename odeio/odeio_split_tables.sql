drop table if exists organo cascade;
drop table if exists daskalos cascade;
drop table if exists spoudastis cascade;
drop table if exists didaski cascade;

create table organo
(
    kodikos_organou text not null primary key,
    onoma_organou   text not null
);

create table daskalos
(
    kodikos_daskalou text not null primary key,
    onoma_daskalou   text not null,
    kodikos_organou  text not null references organo (kodikos_organou)
);

create table spoudastis
(
    kdidkos_spoudastn text not null primary key,
    onoma_spoudastn   text not null,
    dieuthynsn        text
);

create table didaski
(
    kodikos_daskalou  text not null references daskalos (kodikos_daskalou),
    kdidkos_spoudastn text not null references spoudastis (kdidkos_spoudastn),
    xreosn            integer,
    primary key (kodikos_daskalou, kdidkos_spoudastn)

);

insert into organo
values ('ENX-1', 'Mpouzouki'),
       ('ENX-2', 'Kithara');

insert into daskalos
values ('D-1', 'SERPANOS STELIOS', 'ENX-1'),
       ('D-2', 'APOXHS GIANNIS', 'ENX-1'),
       ('D-3', 'PAGKOS KOSTAS', 'ENX-2');

insert into spoudastis
values ('S-01', 'KOKOS GIANNIS', 'TEI KRHTHS'),
       ('S-02', 'KABOS LAZAROS', 'TEI KRHTHS'),
       ('S-03', 'LHMAS GIORGOS', 'TEI ATHENS');

insert into didaski
values ('D-1', 'S-01', 17),
       ('D-2', 'S-02', 16),
       ('D-3', 'S-03', 17),
       ('D-1', 'S-03', 12);