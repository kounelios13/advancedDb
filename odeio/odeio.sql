drop table if exists odeio cascade;

create table odeio (
kodikos_organou text not null,
onoma_organou text not null,
kodikos_daskalou text not null,
onoma_daskalou text not null,
kdidkos_spoudastn text not null,
onoma_spoudastn text not null,
dieuthynsn text,
xreosn integer
);

insert into odeio values ('ENX-1', 'Mpouzouki', 'D-1', 'SERPANOS STELIOS', 'S-01', 'KOKOS GIANNIS', 'TEI KRHTHS', 17);
insert into odeio values ('ENX-1', 'Mpouzouki', 'D-2', 'APOXHS GIANNIS', 'S-02', 'KABOS LAZAROS', 'TEI KRHTHS', 16);
insert into odeio values ('ENX-2', 'Kithara', 'D-3', 'PAGKOS KOSTAS', 'S-03', 'LHMAS GIORGOS', 'TEI ATHENS', 17);
insert into odeio values ('ENX-1', 'Mpouzouki', 'D-1', 'SERPANOS STELIOS', 'S-03', 'LHMAS GIORGOS', 'TEI ATHENS', 12);

select * from odeio;

create table organo (
kodikos_organou text not null,

);