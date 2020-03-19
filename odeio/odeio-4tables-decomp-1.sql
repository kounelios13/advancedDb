drop table if exists organo cascade;
drop table if exists daskalos cascade;
drop table if exists spoudastns cascade;
drop table if exists xreosn cascade;

create table organo (
kodikos_organou text not null,
onoma_organou text not null,
primary key (kodikos_organou)
);

create table daskalos (
kodikos_daskalou text not null,
onoma_daskalou text not null,
primary key (kodikos_daskalou)
);

create table spoudastns (
kodikos_spoudastn text not null,
onoma_spoudastn text not null,
dieuthynsn text,
primary key (kodikos_spoudastn)
);

create table xreosn (
kodikos_daskalou text not null,
kodikos_spoudastn text not null,
xreosn integer,
foreign key (kodikos_daskalou) references daskalos (kodikos_daskalou),
foreign key (kodikos_spoudastn) references spoudastns (kodikos_spoudastn),
primary key (kodikos_daskalou, kodikos_spoudastn)
);

insert into organo values ('ENX-1', 'Mpouzouki');
insert into organo values ('ENX-2', 'Kithara');

insert into daskalos values ('D-1', 'SERPANOS STELIOS');
insert into daskalos values ('D-2', 'APOXHS GIANNIS');
insert into daskalos values ('D-3', 'PAGKOS KOSTAS');

insert into spoudastns values ('S-01', 'KOKOS GIANNIS', 'TEI KRHTHS');
insert into spoudastns values ('S-02', 'KABOS LAZAROS', 'TEI KRHTHS');
insert into spoudastns values ('S-03', 'LHMAS GIORGOS', 'TEI ATHENS');

insert into xreosn values ('D-1', 'S-01', 17);
insert into xreosn values ('D-2', 'S-02', 16);
insert into xreosn values ('D-3', 'S-03', 17);
insert into xreosn values ('D-1', 'S-03', 12);

select * from organo;
select * from daskalos;
select * from spoudastns;
select * from xreosn;
