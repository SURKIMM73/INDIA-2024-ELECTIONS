--TOTAL SEATS
SELECT 
DISTINCT COUNT(Parliament_Constituency) AS "TOTAL NO OF SEATES"
FROM constituencywise_results;

--TOTAL NUMBER OF SEATS IN EACH STATES
SELECT states.State, 
COUNT(constituencywise_results.Parliament_Constituency) AS "TOTAL NUMBER OF SEATS"
FROM constituencywise_results
INNER JOIN statewise_results
ON constituencywise_results.Parliament_Constituency = statewise_results.Parliament_Constituency
inner join states
on statewise_results.State_ID =states.State_ID
GROUP BY states.State;

--TOTAL SEATES WON BY NDA ALIANCEE
select
SUM(case
        when party in('Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
) then 1
else 0
end) as  "NDA TOTAL SEATs"
from partywise_results

--SEATES WON BY NDA ALIANCE
select Party,won
from partywise_results
where party in(        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
);

-- TOTAL SEATS WON BY INDIA ALLIANCE
 select 
 sum(case
         when party in('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'

) then 1
else 0
end) "NDA TOTAL SEATS"
from partywise_results;

--	SEATES WON BY INDIA ALLIANCE
select party,won
from partywise_results
where party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
)
-- ADD COLUMN PARTY ALLIANCE IN PARTYYWISE_RESULTS
alter table partywise_results
add  PARTY_ALLIANCE varchar(100);
 
select * from partywise_results;

update partywise_results
set PARTY_ALLIANCE = case
    when party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK') then 'INDIA ALLIANCE'
				when party in('Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM') then 'NDA ALLIANCE'
		else 'OTHERS'
		end;

-- WINNING CANDIDATE'S NAME, PARTY NAME,TOTAL VOTES MARGIN OF VICTORY FOR A SPECIFICC STATE AND CONSITUENCY
SELECT CONSTITUENCYWISE_RESULTS.Winning_Candidate , PARTYWISE_RESULTS.Party,CONSTITUENCYWISE_RESULTS.Total_Votes,CONSTITUENCYWISE_RESULTS.margin,STATEWISE_RESULTS.State
from CONSTITUENCYWISE_DETAILS inner join CONSTITUENCYWISE_RESULTS
on CONSTITUENCYWISE_DETAILS.Constituency_id = CONSTITUENCYWISE_RESULTS.Constituency_ID
inner join  PARTYWISE_RESULTS
on CONSTITUENCYWISE_RESULTS.Party_ID =  PARTYWISE_RESULTS.Party_ID
inner join STATEWISE_RESULTS
on 
CONSTITUENCYWISE_RESULTS.Parliament_Constituency = STATEWISE_RESULTS.Parliament_Constituency

--DISTRIBUTION OF EMV VOTES V/S POSTAL VOTES FOR CANDIDATES IN SPECIFIC CONSTITUENCY
select 
constituencywise_details.Candidate ,constituencywise_details.EVM_Votes,constituencywise_details.postal_votes,constituencywise_results.Constituency_Name
from  constituencywise_details
inner join constituencywise_results
on constituencywise_details.Constituency_ID = constituencywise_results.Constituency_ID

--parties which won most seats in a state and the number of seats won by each party

select partywise_results.party,constituencywise_results.Parliament_Constituency,statewise_results.state	,count(Constituency_ID)
from partywise_results
inner join constituencywise_results 
on partywise_results.party_id = constituencywise_results.party_id
inner join statewise_results
on constituencywise_results.parliament_constituency = statewise_results.parliament_constituency
group by partywise_results.party,
    constituencywise_results.Parliament_Constituency,
    statewise_results.state;