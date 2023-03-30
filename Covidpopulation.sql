select * from CovidDeaths
order by 3,4;

select location,date, new_cases, total_deaths, population
From CovidDeaths
order by 3,4;

-- Total cases vs Total Deaths

select location, date, (total_deaths/total_cases)*100 as deathPercentage
From CovidDeaths
order by 1,2;

-- Total cases vs Total deaths in the United States

select location, date, (total_deaths/total_cases)*100 as deathPercentage
From CovidDeaths
Where location like '%states%'
order by 1,2;

-- Looking at the Total cases vs Population

select location, date, population, total_cases, (total_cases/population)*100 as deathPercentage
From CovidDeaths
order by 1,2;

-- Looking at Countries with highest infection rate compared to population

select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as percentPopulationInfected
From CovidDeaths
Group by location, population
order by PercentPopulationInfected desc;

-- breaking it down by continent 
select continent, max(Total_cases) as TotalCases
From CovidDeaths
where continent is not null
GROUP BY continent
order by TotalCases desc;


--  Countries with Highest Death Count per Population
select location, population, MAX(total_deaths) as HighestDeathCount
From CovidDeaths
Where continent is not null
Group by location, population
order by HighestDeathCount desc;

-- GLOBAL NUMBERS COMBINED

select SUM(new_cases) as AllCases, SUM(new_deaths) as AllDeaths, SUM(New_deaths)/SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
order by 1,2;

-- GLOBAL NUMBERS

select date, SUM(new_cases) as AllCases, SUM(new_deaths) as AllDeaths, SUM(New_deaths)/SUM(new_cases)*100 as DeathPercentage
From CovidDeaths
GROUP BY date
order by 1,2;

-- Looking at Total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.total_vaccinations
FROM CovidDeaths dea
join covidvaccinations vac
	On dea.location = vac.location
    and dea.date = vac.date
order by 2,3;

select dea.location, vac.total_vaccinations
FROM ProjectPortfolio
order by 2,3;

