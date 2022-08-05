-- Selecting Data that we are going to be starting with
Select *
From covid_data
Where continent is not null 

--Selecting Specific columns with non-null values to give us a brief overview of the data
Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Where continent is not null 

--Looking At Total Cases vs Total Deaths In Countries
-- Shows likelihood of dying if you contract covid in your country
Select Location, continent,dates ,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From covid_data
Where continent is not null 


-- Comparing The Total Cases In A Country Against Population.
-- Shows what percentage of the population has been infected with Covid
Select Location, dates, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From covid_data

-- Selecting The Countries With The Highest Infection Rate 
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From covid_data
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Rate per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From covid_data
Where continent is not null 
Group by Location
order by TotalDeathCount desc


-- BREAKING THINGS DOWN BY CONTINENT
-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From covid_data
Where continent is not null 
Group by continent
order by TotalDeathCount desc


-- Looking at GLOBAL NUMBERS FOR TOTAL CASES, TOTAL DEATHS NEW DEATHS AND NEW CASES
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From covid_data
where continent is not null 
Group By dates

