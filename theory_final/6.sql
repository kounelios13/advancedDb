drop table if exists omada;
drop table if exists paixtis;
drop table if exists symbolaio;

create table omada(
    onomao text,
    primary key (onomao)
);

create table paixtis(
    onomap text,
    primary key (onomap)
);

create table symbolaio(
    onomao text,
    onomap text,
    ajia int,
    fanela int,
    primary key (onomao, onomap)
);

insert into omada values ('olimpiakos');
insert into omada values ('panathinaikos');

insert into paixtis values ('anatolakis');
insert into paixtis values ('apostolakis');
insert into paixtis values ('pathiakakis');

insert into symbolaio values ('olimpiakos','apostolakis', 1000, 02);
insert into symbolaio values ('panathinaikos','anatolakis', 1000, 22);
insert into symbolaio values ('panathinaikos','pathiakakis', 1000, 32);