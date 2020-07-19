-- Query to find emission data of all countries from Year 1990 to Year 2017.
Select * from emission_data;

-- Query to find maximum emission Country and its Greenhouse gas in Tonnes. 
select Country, Year2017 as Emission, 2017 from emission_data where Year2017= (  Select  max(Year2017) from emission_data)
union
select Country, Year2016 as Emission, 2016 from emission_data where Year2016= (  Select  max(Year2016) from emission_data)
union
select Country, Year2015 as Emission, 2015 from emission_data where Year2015= (  Select  max(Year2015) from emission_data)
union
select Country, Year2010 as Emission, 2010 from emission_data where Year2010= (  Select  max(Year2010) from emission_data)
union
select Country, Year2000 as Emission, 2000 from emission_data where Year2000= (  Select  max(Year2000) from emission_data)
union 
select Country, Year1990 as Emission, 1990 from emission_data where Year1990= (  Select  max(Year1990) from emission_data);
 
-- Query to find the countries having highest emission growth in recent years data aranged from highest emission in tonnes to lowest.
Select Country, Year2017, year2016, (Year2017-Year2016)  as Emission_Growth, ((Year2017-Year2016)/Year2016)* 100 as Emission_Growth_Percent
 from emission_data order by Emission_Growth desc;
 
-- Query to find the countries having highest emission growth in last 3 decades aranged from highest emission in tonnes to lowest.
Select Country, Year1990, Year2017, (Year2017-Year1990)  as Emission_Growth_3Decade, ((Year2017-Year1990)/Year1990)*100 as Emission_Growth_3Decade_Percent
 from emission_data order by Emission_Growth_3Decade desc;
 
-- Query to find the countries highest emission to lowest emission in current decade arranged from highest emission in tonnes to lowest.
Select Country, Year2010, Year2017, (Year2017-Year2010)  as Emission_Growth_Current_Decade, ((Year2017-Year2010)/Year2010)*100  as Emission_Growth_CurrentDecade_Percent
 from emission_data order by Emission_Growth_Current_Decade desc;
 
-- Query to find the countries having least increase in emission. 
 Select country, Year2016, Year2017, ((Year2017-Year2016)/Year2016)*100  as Emission_Growth_Least_Percent
 from emission_data order by Emission_Growth_Least_Percent asc;

-- Query to find top five countries having Greenhouse emission in tonnes from highest to lowest.
Select Country, Year2017 from emission_data order by year2017 desc limit 5;
-- Query to find sum of Greenhouse gas emission of top 5 countries.
Select sum(Year2017) as Major_Polluters from emission_data where Country in ('United States', 'China','Russia', 'United Kingdom', 'Germany'); 
-- Query to find Percentage contribution of top 5 emission contributing countries wrt total emission of all the countries together.
select (867636685676/sum(year2017))*100 as Major_Polluters_Contribution from emission_data;

 
 -- Query to find Average Percentage change of Emission in recent years and begining of current decade along with last 2 decades.
 Select round((AVG(Year2017)- AVG(Year2016))/AVG(Year2016)* 100,2) as Average_Emission_Percent_2016_17, 
		round((AVG(Year2016)- AVG(Year2015))/AVG(Year2015)* 100,2) as Average_Emission_Percent_2015_16, 
		round((AVG(Year2015)- AVG(Year2014))/AVG(Year2014)* 100,2) as Average_Emission_Percent_2014_15, 
		round((AVG(Year2011)- AVG(Year2010))/AVG(Year2010)* 100,2) as Average_Emission_Percent_2010_11, 
		round((AVG(Year2001)- AVG(Year2000))/AVG(Year2000)* 100,2) as Average_Emission_Percent_2000_01, 
		round((AVG(Year1991)- AVG(Year1990))/AVG(Year1990)* 100,2) as Average_Emission_Percent_1990_91 from emission_data;
 
-- Query to find Variance, Standard Deviation, Mean and Coefficient of Variation of Emissions in recent 3 years and begining years of current decade along with last 2 decades.
Select  round(variance(Year2017),2) as Variance_2017, round(stddev(Year2017),2) as Standard_deviation_2017, round(avg(Year2017),2) as Mean_2017,
		round(stddev(Year2017)/avg(Year2017)*100,2) as Coefficient_of_Variation_Percent_2017 from emission_data;
Select  round(variance(Year2016),2) as Variance_2016, round(stddev(Year2016),2) as Standard_deviation_2016, round(avg(Year2016),2) as Mean_2016,
		round(stddev(Year2016)/avg(Year2016)*100,2) as Coefficient_of_Variation_Percent_2016 from emission_data;
Select  round(variance(Year2015),2) as Variance_2015, round(stddev(Year2015),2) as Standard_deviation_2015, round(avg(Year2015),2) as Mean_2015, 
		round(stddev(Year2015)/avg(Year2015)*100,2) as Coefficient_of_Variation_Percent_2015 from emission_data;
Select  round(variance(Year2010),2) as Variance_2010, round(stddev(Year2010),2) as Standard_deviation_2010, round(avg(Year2010),2) as Mean_2010, 
		round(stddev(Year2010)/avg(Year2010)*100,2) as Coefficient_of_Variation_Percent_2010 from emission_data;
Select  round(variance(Year2000),2) as Variance_2000, round(stddev(Year2000),2) as Standard_deviation_2000, round(avg(Year2000),2) as Mean_2000, 
		round(stddev(Year2000)/avg(Year2000)*100,2) as Coefficient_of_Variation_Percent_2000 from emission_data;
Select  round(variance(Year1990),2) as Variance_1990, round(stddev(Year1990),2) as Standard_deviation_1990, round(avg(Year1990),2) as Mean_1990, 
		round(stddev(Year1990)/avg(Year1990)*100,2) as Coefficient_of_Variation_Percent_1990 from emission_data;

