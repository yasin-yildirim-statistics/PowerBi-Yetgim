/* select * from vw_players_info where "Cinsiyet" = 'Kadın' order by "Oyuncu Maaşı";

SELECT
t.name as "Takım Adı",
t.since as "Kuruluş Tarihi",
t.team_value as "Takım Değeri",
l.name as "Lig Adı",
s.name as "Sponsor Adı",
s.description as "Sponsor Açıklaması",
s.value as "Sponsorluk Değeri",
b.name as "Branş Adı",
c.name as "Ülke Adı",
coachs.name AS "Koç Adı",
coachs.surname AS "Koç Soyadı"
FROM teams t
INNER JOIN team_leagues tl on t.id = tl.team_id
INNER JOIN leagues l on tl.league_id = l.id
INNER JOIN teams_sponsorships ts on t.id = ts.team_id
INNER JOIN sponsorships s on s.id = ts.sponsorship_id
INNER JOIN teams_branches tb on tb.team_id = t.id
INNER JOIN branchs b on b.id = tb.branch_id
INNER JOIN countries c on l.country_id = c.id
INNER JOIN coachs on coachs.team_id = t.id;


create view vw_coaches_info as
SELECT
t.name as "Takım Adı",
t.since as "Kuruluş Tarihi",
t.team_value as "Takım Değeri",
l.name as "Lig Adı",
s.name as "Sponsor Adı",
s.description as "Sponsor Açıklaması",
s.value as "Sponsorluk Değeri",
b.name as "Branş Adı",
c.name as "Ülke Adı",
coachs.name AS "Koç Adı",
coachs.surname AS "Koç Soyadı"
FROM teams t
INNER JOIN team_leagues tl on t.id = tl.team_id
INNER JOIN leagues l on tl.league_id = l.id
INNER JOIN teams_sponsorships ts on t.id = ts.team_id
INNER JOIN sponsorships s on s.id = ts.sponsorship_id
INNER JOIN teams_branches tb on tb.team_id = t.id
INNER JOIN branchs b on b.id = tb.branch_id
INNER JOIN countries c on l.country_id = c.id
INNER JOIN coachs on coachs.team_id = t.id;

*/
select *from vw_players_info where "Cinsiyet" = 'Kadın' order by "Oyuncu Maaşı";


create view vw_coachs_info as
select
c.name as "Koç Adı",
c.surname as "Koç Soyadı",
c."Gender" as "Cinsiyeti",
c.salary as "Maaş",
c.birth_date as "Doğum Tarihi",
b.name as "Branşı",
co.name as "Ülke Adı"
from coachs c
INNER JOIN teams t on c.team_id = t.id
INNER JOIN branchs b on b.id = c.branch_id
INNER JOIN countries co on c.country_id = co.id;



create view vw_teams_info as
SELECT
t.name as "Takım Adı",
t.since as "Kuruluş Tarihi",
t.team_value as "Takım Değeri",
l.name as "Lig Adı",
s.name as "Sponsor Adı",
s.description as "Sponsor Açıklaması",
s.value as "Sponsorluk Değeri",
b.name as "Branş Adı",
c.name as "Ülke Adı",
CONCAT(coachs.name, ' ', coachs.surname) as "Koç Tam Adı"
FROM teams t
INNER JOIN team_leagues tl on t.id = tl.team_id
INNER JOIN leagues l on tl.league_id = l.id
INNER JOIN teams_sponsorships ts on t.id = ts.team_id
INNER JOIN sponsorships s on s.id = ts.sponsorship_id
INNER JOIN teams_branches tb on tb.team_id = t.id
INNER JOIN branchs b on b.id = tb.branch_id
INNER JOIN countries c on l.country_id = c.id
INNER JOIN coachs on coachs.team_id = t.id;



-- COUNT , MAX, MIN, SUM , AVG

SELECT "Cinsiyet", COUNT(*)   FROM vw_players_info
GROUP BY "Cinsiyet";

select "Ülke Adı", COUNT(*) as "Koç Sayısı" from vw_coachs_info Group by "Ülke Adı";