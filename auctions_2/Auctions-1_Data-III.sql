INSERT INTO EXPERT
VALUES ('marcelo97', 'marcelo', 'mollaj', 'Male', ROW ('L. Minoos 42', 'Herakleion', '71303'), ARRAY ['T02', 'T06']);

INSERT INTO COLLECTOR
VALUES ('mitsos13', 'dimitris', 'mimis', 'Male', ROW ('Andrea Kalvou 12', 'Syros', '84100'));

INSERT INTO COLLECTOR
VALUES ('mariap', 'maria', 'papa', 'Female', ROW ('East Bay 211', 'San Francisco', '44352'));

INSERT INTO COLLECTOR
VALUES ('john', 'gianis', 'spaliaras', 'Male', ROW ('Petrou Ralli 12', 'Athina', '96000'));

insert into interest
values ('marcelo97', 'AU01');
insert into interest
values ('marcelo97', 'AU02');
insert into interest
values ('marcelo97', 'AU05');
insert into interest
values ('marcelo97', 'AU06');

insert into interest
values ('mitsos13', 'AU01');
insert into interest
values ('mitsos13', 'AU03');
insert into interest
values ('mitsos13', 'AU05');
insert into interest
values ('mitsos13', 'AU07');

insert into interest
values ('mariap', 'AU02');
insert into interest
values ('mariap', 'AU04');
insert into interest
values ('mariap', 'AU06');
insert into interest
values ('mariap', 'AU03');

insert into interest
values ('john', 'AU01');
insert into interest
values ('john', 'AU02');
insert into interest
values ('john', 'AU03');
insert into interest
values ('john', 'AU04');

insert into posts
values (1001, 'marcelo97', 'AU04', ROW ('marcelo97','this art is amazing', NOW(),ARRAY ['ΑW04']));
insert into posts
values (1002, 'marcelo97', 'AU06', ROW ('marcelo97','worth a million dollars', NOW(),ARRAY ['ΑW06','ΑW08']));

insert into posts
values (1003, 'mitsos13', 'AU07', ROW ('mitsos13','wanna buy some of this', NOW(),ARRAY ['ΑW01','ΑW05','ΑW08']));
insert into posts
values (1004, 'mitsos13', 'AU05', ROW ('mariap','will fit in your collection', NOW(),ARRAY ['ΑW05','ΑW08']));

insert into posts
values (1005, 'mariap', 'AU04', ROW ('mitsos13','do you need this?', NOW(),ARRAY ['ΑW09','ΑW08']));
insert into posts
values (1006, 'mariap', 'AU03', ROW ('mariap','I love this one <3 <3', NOW(),ARRAY ['ΑW10']));

insert into posts
values (1007, 'john', 'AU01', ROW ('mitsos13','you won`t boy nothing he he he', NOW(),ARRAY ['ΑW14','ΑW22']));
insert into posts
values (1008, 'john', 'AU04',
        ROW ('mariap','you won`t boy nothing  he he he', NOW(),ARRAY ['ΑW03','ΑW04','ΑW09','ΑW12']));
insert into posts
values (1009, 'john', 'AU03',
        ROW ('marcelo97','you won`t boy nothing he he he', NOW(),ARRAY ['ΑW07','ΑW10','ΑW13','ΑW19']));
insert into posts
values (1010, 'john', 'AU07', ROW ('john','this are mine', NOW(),ARRAY ['ΑW01','ΑW02']));