select * from players;

select * from countries; --name
select * from teams; --name


--name, surname, team_name, country_name_ salary, gender

select p.name     as "Oyuncunun Adı",
       p.surname  as "Oyuncunun Soyadı",
       t.name     as "Takım Adı",
       c.name     as "Ülke Adı",
       p.salary   as "Maaş",
       p."Gender" as "Cinsiyet",
       po.name    as "Pozisyon"
from players p
         inner join teams t on p.team_id = t.id
         inner join countries c on p.country_id = c.id
         inner join teams_branches tb on p.team_id = tb.team_id
         inner join branchs b on tb.branch_id = b.id
         inner join positions po on po.branch_id = b.id
         inner join players_positions pp on pp.position_id = po.id
group by "Oyuncunun Adı", "Oyuncunun Soyadı", "Takım Adı", "Ülke Adı", "Maaş", "Cinsiyet", "Pozisyon"
order by "Maaş" desc;

--hocanın

SELECT
players.name as "Sporcu İsmi" ,
players.surname as "Sporcu Soyadı",
teams.name as "Takım Adı",
countries.name as "Ülke Adı",
players.salary as "Oyuncu Maaşı",
players."Gender" as "Cinsiyet",
branchs.name as "Branş Adı",
positions.name  as "Pozisyon Adı"
FROM players
INNER JOIN teams on players.team_id = teams.id
INNER JOIN countries on players.country_id = countries.id
INNER JOIN teams_branches on teams_branches.team_id = players.team_id
INNER JOIN branchs on teams_branches.branch_id = branchs.id
Inner join players_positions ON players_positions.player_id = players.id
INNER JOIN positions on players_positions.position_id = positions.id;


-- view oluşturmak
-- sorun var
create view vm_players_info_broken as
select p.name     as "Oyuncunun Adı",
       p.surname  as "Oyuncunun Soyadı",
       t.name     as "Takım Adı",
       c.name     as "Ülke Adı",
       p.salary   as "Maaş",
       p."Gender" as "Cinsiyet",
       po.name    as "Pozisyon"
from players p
         inner join teams t on p.team_id = t.id
         inner join countries c on p.country_id = c.id
         inner join teams_branches tb on p.team_id = tb.team_id
         inner join branchs b on tb.branch_id = b.id
         inner join positions po on po.branch_id = b.id
         inner join players_positions pp on pp.position_id = po.id;

-- hocanın
-- create view view_ismi as
create view vw_players_info as
SELECT
players.name as "Sporcu İsmi" ,
players.surname as "Sporcu Soyadı",
teams.name as "Takım Adı",
countries.name as "Ülke Adı",
players.salary as "Oyuncu Maaşı",
players."Gender" as "Cinsiyet",
branchs.name as "Branş Adı",
positions.name  as "Pozisyon Adı"
FROM players
INNER JOIN teams on players.team_id = teams.id
INNER JOIN countries on players.country_id = countries.id
INNER JOIN teams_branches on teams_branches.team_id = players.team_id
INNER JOIN branchs on teams_branches.branch_id = branchs.id
Inner join players_positions ON players_positions.player_id = players.id
INNER JOIN positions on players_positions.position_id = positions.id;
