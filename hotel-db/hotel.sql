drop table if exists ksenodoxeio cascade;
drop table if exists pelatis cascade;
drop table if exists timi_domatiou cascade;
drop table if exists kratisi_ksenodoxeiou cascade;

create table ksenodoxeio
(
    kod_ksenodoxeiou        integer,
    onoma_ksenodoxeiou      text,
    katiforia_ksenodoxeiou  text,
    topothesia_ksenodoxeiou text,
    primary key (kod_ksenodoxeiou)
);

create table pelatis
(
    kod_pelati      integer,
    onoma_pelati    text,
    tilefono_pelati text,
    primary key (kod_pelati)
);

create table timi_domatiou
(
    kod_ksenodoxeiou integer,
    kod_domatiou     integer unique,
    timi_ana_hmera   integer,
    primary key (kod_ksenodoxeiou, kod_domatiou),
    foreign key (kod_ksenodoxeiou) references ksenodoxeio (kod_ksenodoxeiou)
);

create table kratisi_ksenodoxeiou
(
    kod_ksenodoxeiou          integer,
    kod_pelati                integer,
    hmerominia_afiksis_pelati date,
    kod_domatiou              integer,
    heres_diamonhs_pelati     integer,
    primary key (kod_ksenodoxeiou, kod_pelati, hmerominia_afiksis_pelati),
    foreign key (kod_ksenodoxeiou) references ksenodoxeio (kod_ksenodoxeiou),
    foreign key (kod_pelati) references pelatis (kod_pelati),
    foreign key (kod_domatiou) references timi_domatiou (kod_domatiou)
);

insert into ksenodoxeio
values (1, 'herakleion hotel', '*****', 'herakleio'),
       (2, 'rethimno palace', '****', 'rethimno');

insert into pelatis
values (101, 'Marcelo', '6949390637'),
       (102, 'Kostas', '6983160821');

insert into timi_domatiou
values (1, 301, 150),
       (2, 501, 80);

insert into kratisi_ksenodoxeiou
values (1, 101, '2020-06-23', 301, 5),
       (2, 102, '2020-08-13', 501, 8);


select *
from kratisi_ksenodoxeiou
         natural join timi_domatiou
         natural join ksenodoxeio
         natural join pelatis;


-----------------------------------
create table kratisi_ksenodoxeiou_all
(
    kod_ksenodoxeiou          integer,
    kod_domatiou              integer unique,
    onoma_ksenodoxeiou        text,
    katiforia_ksenodoxeiou    text,
    topothesia_ksenodoxeiou   text,
    kod_pelati                integer,
    onoma_pelati              text,
    tilefono_pelati           text,
    hmerominia_afiksis_pelati date,
    heres_diamonhs_pelati     integer,
    timi_ana_hmera            integer,
    primary key (kod_ksenodoxeiou, kod_pelati, hmerominia_afiksis_pelati)
);

insert into kratisi_ksenodoxeiou_all
values (1, 301, 'herakleion hotel', '*****', 'herakleio', 101, 'Marcelo', '6949390637', '2020-06-23', 5, 150),
       (2, 501, 'rethimno palace', '****', 'rethimno', 102, 'Kostas', '6983160821', '2020-08-13', 8, 80);

select *
from kratisi_ksenodoxeiou_all