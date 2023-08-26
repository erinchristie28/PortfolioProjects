Select*
From [Portfolio Project]..CovidDeaths
order by 3,4


Select*
From [Portfolio Project]..CovidVaccinations
order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, population
From [Portfolio Project]..CovidDeaths
order by 1,2

--Looking at Total Cases vs Total Deaths
--Shows likelihood of dying if you contract Covid in your Country

Select Location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage 
From [Portfolio Project]..CovidDeaths
where location like  '%states%'
order by 1,2

--Looking at Total Cases vs Population
--Shows what precentage of populaion got Covid

Select Location, date, total_cases,population,(total_cases/population)*100 as PercentofPopulationINfected
From [Portfolio Project]..CovidDeaths
order by 1,2

--Looking at Countries with highest infection rate commpared to Population

Select Location, population, MAX(total_cases)as HighestInfectionCount,MAX((total_cases/population))*100 as PercentofPopulationInfected 
From [Portfolio Project]..CovidDeaths
Group By Location, population
order by PercentofPopulationInfected  desc

--Showing Countries with the highest Death Count per population

Select countries, MAX(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths
Group By Location, population
order by TotalDeathCount  desc


--Showing contitents with the highest death count per population

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths
Where continent is not null
Group By Continent
order by TotalDeathCount  desc

--Looking at Total Population vs Vacinations

Select dea.continent, dea.location,dea.date, dea.population, vac.new_vaccinations
From [Portfolio Project]..CovidDeaths dea
Join [Portfolio Project]..CovidVaccinations vac 
On dea.location = vac.location
Where dea.continent is not null
and dea.date = vac.date
Order by 1,2,3