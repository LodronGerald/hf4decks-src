-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: common
-- ------------------------------------------------------
-- Server version	5.6.50

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hf_all`
--

DROP TABLE IF EXISTS `hf_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_all` (
  `id` text,
  `name` text,
  `side` int(11) DEFAULT NULL,
  `component` text,
  `type` text,
  `spectral_type` text,
  `mass` text,
  `rad_hard` text,
  `support` text,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_all`
--

LOCK TABLES `hf_all` WRITE;
/*!40000 ALTER TABLE `hf_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `hf_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_freighters`
--

DROP TABLE IF EXISTS `hf_freighters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_freighters` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `spectral_type` varchar(4) DEFAULT NULL,
  `promotion_colony` varchar(4) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `load_limit` int(11) DEFAULT NULL,
  `factory_loading_only` int(11) DEFAULT NULL,
  `bonus_pivots` int(11) DEFAULT NULL,
  `provided_generator` varchar(1) DEFAULT NULL,
  `provided_reactor` varchar(1) DEFAULT NULL,
  `ability` varchar(128) DEFAULT NULL,
  `future` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_freighters`
--

LOCK TABLES `hf_freighters` WRITE;
/*!40000 ALTER TABLE `hf_freighters` DISABLE KEYS */;
INSERT INTO `hf_freighters` VALUES ('M1F165F','Fission-Heated Steam','Freighter','Any','M',0,5,2,1,0,NULL,'O',NULL,NULL),('M1F165R','Fission GCR','Freighter Fleet','Any','M',1,6,6,NULL,0,NULL,'O','Can liftoff/land on Sites that are less than size 6 without factory-assist.','EXOPLANET HUNT FUTURE: Req = Claim Sedna. Effect = (Endgame) 12 VP.'),('M1F168F','Fusion Fragment Sail','Freighter','V','M',2,1,2,NULL,1,NULL,NULL,'Immune to flares & radiation belts.',NULL),('M1F168R','Antiproton Sail and Harvester','Freighter Fleet','V','M',2,9,6,NULL,4,NULL,NULL,'+1 net thrust if starting its move on a radiation belt.','ANTIMATTER FUTURE: Req = Promoted Bernal with S Dirtside. Effects = double isotope refuel, 10 VP.'),('M1F169F','HIIPER Beam Rider','Freighter','V','Push',4,4,4,NULL,1,'E',NULL,NULL,NULL),('M1F169R','Magnetic Mirror Beam Rider','Freighter Fleet','V','Push',3,6,5,NULL,3,'E',NULL,'Can liftoff/land on Sites that are less than size 6 without factory-assist.','STAR WISP FUTURE: Req = Promoted Freighter (End game) at either neutrino sunlens (6 VP) or EM sunlens = 11 VP.'),('M1F163F','Inflatable Solar-Heated','Freighter','Any','C',0,5,2,1,0,NULL,NULL,'SOLAR HEATED: If not using Powersat, may move out only as far as the Ceres zone.',NULL),('M1F163R','Archimedes Palmer Lens','Freighter Fleet','Any','C',0,10,5,1,0,NULL,NULL,'SOLAR HEATED: If not using Powersat, may move out only as far as the Jupiter zone.','TERRAFORM FUTURE: Req = Promoted Bernal at a non-Martian Atmospheric Dirtside. Effect = 8 VP.'),('M1F166F','Poodle Steam','Freighter','Any','S',0,7,2,1,0,NULL,NULL,'RADIOISOTOPE: +2 thrust if its move starts on a Factory.',NULL),('M1F166R','D-Nanotube Dirt Launcher','Freighter Fleet','Any','S',0,9,3,NULL,0,NULL,NULL,NULL,'BEANSTALK FUTURE: Req = 3+ Space Elevators built by any player. Effect (Endgame) = +3 VP for each Factory connected to a Space Elevator.'),('M1F164F','Rotary Dirt Launcher','Freighter','Any','C',5,4,2,1,0,'E','O',NULL,NULL),('M1F164R','KESTS Hoop Dirt Launcher','Freighter Fleet','Any','C',15,8,15,1,0,'E','O',NULL,'BEEHIVE ARK FUTURE: Req = Promoted Bernal anchored at a Synodic Comet. Effect = 7 VP.'),('M1F167F','Z-Pinch D-T / 6Li Fusion','Freighter','V','H',5,3,3,NULL,1,'P','X',NULL,NULL),('M1F167R','Z-Pinch 3He-D Target Fusion','Freighter Fleet','V','H',2,6,6,NULL,2,'P','X',NULL,'GOLDEN APPLES FUTURE: Req = Industrialize Kreutz Sungrazer. Effects = Ignore solar flares, 14 VP.');
/*!40000 ALTER TABLE `hf_freighters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_bernals`
--

DROP TABLE IF EXISTS `hf_bernals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_bernals` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `promotion_colony` varchar(16) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `thrust` int(11) DEFAULT NULL,
  `fuel_consumption` int(11) DEFAULT NULL,
  `powersat` int(11) DEFAULT NULL,
  `required_generator` varchar(1) DEFAULT NULL,
  `required_therms` int(11) DEFAULT NULL,
  `ability` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_bernals`
--

LOCK TABLES `hf_bernals` WRITE;
/*!40000 ALTER TABLE `hf_bernals` DISABLE KEYS */;
INSERT INTO `hf_bernals` VALUES ('M2B178F','GEO Elevator Bernal','Bernal','Atmospheric',10,6,3,3,1,'E',0,'HOME: Boost direct to Home Bernal without doubling boost costs.'),('M2B178R','Space Elevator Lab','Promoted Bernal',NULL,10,7,3,3,1,'E',0,'Your factory-assisted landings/liftoffs anywhere treat lander burns as normal Burn Spaces.'),('M2B172F','L1 Climate Control Bernal','Bernal','Atmospheric',10,8,3,3,1,'E',0,'HOME: You are always the 1st player, superseding all other claimants.'),('M2B172R','Climate Control Lab','Promoted Bernal',NULL,12,8,3,3,1,'E',0,'+2 VP per Dirtside for this Bernal.'),('M2B173F','L2 Collimator Bernal','Bernal','Push',10,8,3,3,1,'E',0,'HOME: Gain the Powersat faction privilege.'),('M2B173R','Collimator Lab','Promoted Bernal',NULL,10,9,3,3,1,'E',0,'Gain the Powersat faction privilege. Powersat push includes a Bonus Pivot.'),('M2B175F','L3 Lofstrom Loop Microgravity','Bernal','Submarine',10,8,3,3,1,'E',0,'HOME: Boost direct to Home Bernal without doubling boost costs.'),('M2B175R','Lofstrom Loop Microgravity Lab','Promoted Bernal',NULL,10,9,3,3,1,'E',0,'Your factory-assisted landings/liftoffs anywhere treat lander burns as normal Burn Spaces.'),('M2B170F','L4 Antimatter Factory','Bernal','M',10,9,3,3,1,'E',2,'HOME: Your Crew has an On-Board Nuclear X reactor.'),('M2B170R','Antimatter Lab','Promoted Bernal',NULL,10,10,3,3,1,'E',2,'\"Your Crew has an On-Board Nuclear \"\"ANY\"\" reactor.\"'),('M2B176F','L4s Pharmaceutics Bernal','Bernal','Astrobiology',10,6,3,3,1,'E',0,'HOME: Gain the Skunkworks faction privilege.'),('M2B176R','Pharmaceutics Lab','Promoted Bernal',NULL,10,7,3,3,1,'E',0,'Gain the Skunkworks faction privilege & impose academia hand limit on all opponents.'),('M2B177F','L5 Solar Cell Factory','Bernal','Push',10,6,3,3,1,'E',0,'HOME: +1 to the Net Thrust of your Spacecraft that use Solar-Power.'),('M2B177R','Solar Cell Lab','Promoted Bernal',NULL,10,8,3,3,1,'E',0,'+2 to the Net Thrust of your Spacecraft that use Solar-Power.'),('M2B171F','L5s Cancer Hospital','Bernal','Submarine',10,6,3,3,1,'E',0,'HOME: You are immune to budget cuts.'),('M2B171R','Cancer Lab','Promoted Bernal',NULL,12,7,3,3,1,'E',0,'Gain +1 Token VP for each Colony Dome. Your Crew and Human Colonists have a rad-hard of at least 7.'),('M2B174F','SSO Diplomatic','Bernal','Astrobiology',10,6,3,3,1,'E',0,'HOME: (Module 0) Your delegates in the Ideology of your Faction color are +1 VP each.'),('M2B174R','Diplomatic Lab','Promoted Bernal',NULL,10,7,3,3,1,'E',0,'(Module 0) Your delegates in the assembly are +1 VP each.'),('M2B179F','Tourism Cycler','Bernal','Atmospheric',10,7,3,3,1,'E',0,'HOME: Can designate any Spacecraft to forgo Belt Rolls in the Radiation Belts near Earth.'),('M2B179R','Tourism Hotel','Promoted Bernal',NULL,10,7,3,3,1,'E',0,'+2 VP per Dirtside for this Bernal.'),('PHFB198F','L2 Force Field Bernal','Bernal','H',10,10,3,3,1,'E',2,'All your other cards have +1 rad-hardness.'),('PHFB198R','Force Field Lab','Promoted Bernal',NULL,10,10,3,3,1,'E',0,'All your other cards have +3 rad-hardness.'),('PHFB199F','Catcher’s Mitt Bernal','Bernal','H',10,6,3,3,1,'E',2,'HOME: Gain the Powersat faction privilege.'),('PHFB199R','Catcher’s Mitt Lab','Promoted Bernal',NULL,10,10,3,3,1,'E',2,'Gain the Powersat faction privilege. Powersat push includes a Bonus Pivot.');
/*!40000 ALTER TABLE `hf_bernals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_generators`
--

DROP TABLE IF EXISTS `hf_generators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_generators` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `type_p` int(11) DEFAULT NULL,
  `type_e` int(11) DEFAULT NULL,
  `thrust_modifier` varchar(1) DEFAULT NULL,
  `fuel_consumption_modifier` varchar(1) DEFAULT NULL,
  `air_eater` int(11) DEFAULT NULL,
  `solar` int(11) DEFAULT NULL,
  `support_generator_p` int(11) DEFAULT NULL,
  `support_reactor_x` int(11) DEFAULT NULL,
  `support_reactor_o` int(11) DEFAULT NULL,
  `support_reactor_b` int(11) DEFAULT NULL,
  `therms` int(11) DEFAULT NULL,
  `ability` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_generators`
--

LOCK TABLES `hf_generators` WRITE;
/*!40000 ALTER TABLE `hf_generators` DISABLE KEYS */;
INSERT INTO `hf_generators` VALUES ('CG104F','AMTEC Thermoelectric','C',1,6,1,1,NULL,NULL,1,0,0,0,1,0,1,NULL),('CG104R','JTEC H2 Thermoelectric','C',1,4,1,1,NULL,NULL,1,1,0,0,0,0,NULL,NULL),('CG107F','Brayton Turbine','C',1,5,1,1,NULL,NULL,1,0,0,0,1,1,2,NULL),('CG107R',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hf_generators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_gwthrusters`
--

DROP TABLE IF EXISTS `hf_gwthrusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_gwthrusters` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `promotion_colony` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `thrust` int(11) DEFAULT NULL,
  `fuel_consumption` varchar(4) DEFAULT NULL,
  `afterburn` int(11) DEFAULT NULL,
  `required_generator` varchar(1) DEFAULT NULL,
  `required_reactor` varchar(1) DEFAULT NULL,
  `required_therms` int(11) DEFAULT NULL,
  `future` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_gwthrusters`
--

LOCK TABLES `hf_gwthrusters` WRITE;
/*!40000 ALTER TABLE `hf_gwthrusters` DISABLE KEYS */;
INSERT INTO `hf_gwthrusters` VALUES ('M1W157F','Amat-Catalyzed Fission-Fusion','GW Thruster','S','D',3,9,10,'1/3',2,NULL,'X',2,NULL),('M1W157R','Amat-Initiated H-B Magnetic-Inertial','TW Thruster','S',NULL,1,10,8,'0',5,'P',NULL,1,'MINI-BLACK HOLE FUTURE: Req = Industrialized centaur with 10 isotope FTs. Effects = double all isotope refuel, 10 VP.'),('M1W160F','Dense Plasma H-B Focus Fusion','GW Thruster','D','D',1,8,2,'1/10',5,'P',NULL,NULL,NULL),('M1W160R','Crossfire H-B Focus Fusion','TW Thruster','D',NULL,1,9,3,'0',9,'P',NULL,NULL,'PROTIUM FUSION FUTURE: Req = Promoted Bernal with H Dirtside. Effects = double all isotope refuel, 10 VP.'),('M1W158F','Levitated Dipole 6Li-H Fusion','GW Thruster','V','S',4,5,2,'0',4,NULL,NULL,1,NULL),('M1W158R','Dusty Plasma','TW Thruster','V',NULL,2,8,2,'0',9,NULL,NULL,3,'MASS BEAM FUTURE: Req = Promoted Bernal with Io or Triton Dirtside. Effects = your Powersat adds +2 thrust, 7 VP.'),('M1W162F','Mini-Mag Orion Z-Pinch Fission','GW Thruster','M','D',1,9,12,'1/3',NULL,'P',NULL,2,NULL),('M1W162R','Solem Medusa Tugged Orion','TW Thruster','M',NULL,6,9,9,'0',3,'P',NULL,NULL,'LITHIATED AMMONIA ICE STARSHIP FUTURE: Req = Ad astra exit with 10 isotope fuel. Effect = 14 VP.'),('M1W156F','Salt-Water Zubrin','GW Thruster','S','M',1,6,14,'1/2',1,NULL,NULL,5,NULL),('M1W156R','Zubrin-GDM','TW Thruster','S',NULL,3,8,6,'0',8,'P',NULL,4,'SPACEFARING FUTURE: Req = Bernal with 8+ dirtside hydration. Effects = Allowed 1 extra Colonist, 7 VP.'),('M1W161F','Spheromak 3He-D Magnetic Fusion','GW Thruster','H','H',4,8,6,'1/10',6,'E',NULL,4,NULL),('M1W161R','Colliding FRC 3He-D Fusion','TW Thruster','H',NULL,3,9,4,'0',10,'P','A',2,'ENZMANN STARSHIP FUTURE: Req = Ad astra exit with 2 Promoted Colonists + Mobile Factory. Effect = 12 VP.'),('M1W159F','VISTA D-T Inertial Fusion','GW Thruster','H','H',5,8,9,'1/4',3,'P',NULL,2,NULL),('M1W159R','Daedalus 3He-D Inertial Fusion','TW Thruster','H',NULL,5,9,11,'0',8,'P',NULL,3,'FUSION CANDLE FUTURE: Req = Triton Colony & Promoted Bernal with Neptune Aerostat Dirtside. Effects = double all isotope refuel, 14 VP.');
/*!40000 ALTER TABLE `hf_gwthrusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_radiators`
--

DROP TABLE IF EXISTS `hf_radiators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_radiators` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass_l` int(11) DEFAULT NULL,
  `rad_hard_l` int(11) DEFAULT NULL,
  `therms_l` int(11) DEFAULT NULL,
  `mass_h` int(11) DEFAULT NULL,
  `rad_hard_h` int(11) DEFAULT NULL,
  `therms_h` int(11) DEFAULT NULL,
  `required_generators` varchar(1) DEFAULT NULL,
  `ability` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_radiators`
--

LOCK TABLES `hf_radiators` WRITE;
/*!40000 ALTER TABLE `hf_radiators` DISABLE KEYS */;
INSERT INTO `hf_radiators` VALUES ('CD092F','Bubble Membrane','C',0,1,1,1,0,2,'0',NULL),('CD092R','Electrostatic Membrane','C',0,3,1,1,2,3,'0',NULL),('CD100F','Dielectric X-Ray Window','D',4,7,2,5,7,3,'0',NULL),('CD100R','Graphene Crystal X-Ray Mirror','D',0,7,1,1,7,2,'0',NULL),('CD097F','ETHER Charged Dust','M',1,1,1,2,1,2,'0',NULL),('CD097R','Curie Point','M',0,5,1,1,3,3,'0',NULL),('CD102F','Li Heatsink Fountain','S',2,6,1,3,6,5,'0','[Heavy] Switch to light side after 1st use.'),('CD102R','Thermochemical Heatsink Fountain','S',1,6,1,2,6,6,'0','[Heavy] Switch to light side after 1st use.'),('CD099F','Magnetocaloric Refrigerator','S',2,6,3,3,6,4,'E','This card can cool its own supports.'),('CD099R','Nuclear Fuel Spin Polarizer','S',0,5,1,1,4,2,'0',NULL),('CD094F','Microtube Array','C',2,1,2,3,0,3,'0',NULL),('CD094R','Marangoni Flow','C',0,2,2,1,1,3,'0',NULL),('CD098F','Mo / Li Heat Pipe','M',1,2,2,2,1,3,'0',NULL),('CD098R','Tin Droplet','M',0,3,2,1,2,3,'0',NULL),('CD103F','Qu Tube','M',1,4,1,4,2,2,'0',NULL),('CD103R','ANDR / In Dream Pipe','M',0,3,2,1,2,3,'0',NULL),('CD093F','SS / NaK Pumped Loop','M',2,1,2,4,0,3,'0',NULL),('CD093R','Hula-Hoop','M',1,6,2,2,6,3,'0',NULL),('CD096F','Salt-Cooled Reflux Tube','C',3,4,2,4,4,3,'0',NULL),('CD096R','Buckytube Filament','C',0,4,2,1,3,3,'0',NULL),('CD101F','Steel / Pb-Bi Pumped Loop','M',2,3,1,4,2,2,'0',NULL),('CD101R','Pulsating Heat Pipe','M',1,1,2,2,1,4,'0',NULL),('CD095F','Ti / K Heat Pipe','M',2,3,1,4,2,2,'0',NULL),('CD095R','Flux-Pinned Superthermal','M',1,5,1,2,5,3,'0',NULL);
/*!40000 ALTER TABLE `hf_radiators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_reactors`
--

DROP TABLE IF EXISTS `hf_reactors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_reactors` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `type_x` int(11) DEFAULT NULL,
  `type_o` int(11) DEFAULT NULL,
  `type_b` int(11) DEFAULT NULL,
  `thrust_modifier` int(11) DEFAULT NULL,
  `fuel_consumption_modifier` varchar(4) DEFAULT NULL,
  `air_eater` varchar(8) DEFAULT NULL,
  `required_generator` varchar(1) DEFAULT NULL,
  `required_reactor` varchar(1) DEFAULT NULL,
  `therms` int(11) DEFAULT NULL,
  `ability` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_reactors`
--

LOCK TABLES `hf_reactors` WRITE;
/*!40000 ALTER TABLE `hf_reactors` DISABLE KEYS */;
INSERT INTO `hf_reactors` VALUES ('CX090F','Cermet NERVA Fission','S',1,7,0,1,0,3,'1/1','12/30',NULL,'0',NULL,NULL),('CX090R','Pulsed NTR Fission','S',0,7,0,1,1,0,'1/4','12/30',NULL,'0',5,NULL),('CX087F','D-D Fusion Magneto-Inertial','D',1,3,0,0,1,2,'1/1','12/30',NULL,'0',NULL,NULL),('CX087R','H-B Fusion Reciprocating Plasmoid','D',0,7,0,0,1,4,'1/2','12/30',NULL,'0',3,NULL),('CX084F','D-T Fusion Tokamak','H',3,5,0,1,0,3,'1/2','12/30',NULL,'0',2,NULL),('CX084R','Antimatter GDM','H',0,9,1,1,1,0,'1/4','12/30',NULL,'0',3,NULL),('CX091F','D-T Gun Fusion','H',1,9,0,0,1,1,'1/4','12/30','P','0',NULL,NULL),('CX091R','Macron Blowpipe Fusion','H',0,10,1,1,1,0,'1/10','12/30','P','0',NULL,NULL),('CX085F','Lyman Alpha Trap','S',2,4,1,0,1,-2,'1/1','12/30',NULL,'0',NULL,NULL),('CX085R','Free Radical Hydrogen Trap','S',0,4,1,0,1,0,'1/2','12/30',NULL,'0',1,NULL),('CX089F','Metallic Hydrogen','V',0,2,0,0,1,4,'1/1','12/30',NULL,'0',2,NULL),('CX089R','Fission-Augmented D-T Inertial Fusion','V',1,7,0,0,1,7,'1/1','12/30',NULL,'0',2,NULL),('CX083F','Mini-Mag RF Paul Trap','C',1,2,1,0,0,-3,'1/1','1',NULL,'0',NULL,'SCOOP: -2 ISRU for Colocated ISRU platforms at Aerostat Sites.'),('CX083R','Ultracold Neutrons','C',1,5,1,0,1,NULL,NULL,'0',NULL,'0',NULL,'SCOOP: -2 ISRU for Colocated ISRU platforms at Aerostat Sites.'),('CX080F','Pebble Bed Fission','S',1,6,0,1,0,4,'1/1','0',NULL,'0',1,NULL),('CX080R','VCR Light Bulb Fission','S',0,6,0,1,0,2,'1/2','12/30',NULL,'0',1,NULL),('CX086F','Penning Trap','H',2,3,1,0,1,NULL,NULL,'0',NULL,'0',NULL,NULL),('CX086R','3He-D Fusion Mirror Cell','H',1,5,0,1,0,0,'1/4','12/30',NULL,'0',1,NULL),('CX081F','Project Orion','S',6,8,0,0,1,7,'1/1','0',NULL,'0',1,NULL),('CX081R','Project Valkyrie','S',1,9,0,0,1,8,'1/4','12/30',NULL,'X',3,'When activated, Decommission colocated cards with Rad-Hard <4.'),('CX088F','Rubbia Thin Film Fission Hohlraum','M',1,5,0,1,0,0,'1/2','12/30',NULL,'0',1,NULL),('CX088R','Positronium Bottle','M',0,9,1,1,0,0,'1/2','12/30',NULL,'0',1,NULL),('CX082F','Supercritical Water Fission','V',1,7,0,1,0,3,'1/1','0',NULL,'0',2,NULL),('CX082R','H-6Li Fusor','V',0,4,0,1,1,2,'1/1','0',NULL,'0',NULL,NULL);
/*!40000 ALTER TABLE `hf_reactors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_refineries`
--

DROP TABLE IF EXISTS `hf_refineries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_refineries` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `air_eater` int(11) DEFAULT NULL,
  `generator_e` int(11) DEFAULT NULL,
  `reactor_x` int(11) DEFAULT NULL,
  `reactor_o` int(11) DEFAULT NULL,
  `reactor_b` int(11) DEFAULT NULL,
  `ability` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_refineries`
--

LOCK TABLES `hf_refineries` WRITE;
/*!40000 ALTER TABLE `hf_refineries` DISABLE KEYS */;
INSERT INTO `hf_refineries` VALUES ('CF068F','Atomic Layer Deposition','V',2,2,NULL,1,0,0,0,NULL),('CF068R','Ilmenite Semiconductor Film','V',2,6,NULL,0,0,0,0,'POWER GIRDLE: If used to industrialize a non-atmospheric site of size 8+, you permanently gain the Powersat faction privilege.'),('CF073F','Basalt Fiber Spinning','S',3,5,NULL,0,1,1,1,NULL),('CF073R','Von Neumann Santa Claus Machine','S',2,5,NULL,0,0,0,0,'DIVINING NUBOTS: -1 ISRU for Colocated ISRU platform.'),('CF070F','CVD Molding','M',3,5,NULL,0,0,0,0,NULL),('CF070R','Carbonyl Volatilization','M',2,5,NULL,0,0,0,0,'THORIUM BREEDER: -3 to Colocated size rolls on S Sites.'),('CF069F','Carbo-Chlorination','V',2,4,NULL,1,0,0,0,NULL),('CF069R','Solar Carbotherm','V',2,5,NULL,0,0,0,0,'ARCOLOGY: Decommissioning of a robonaut is not needed when this is used to industrialize in the zones Mercury, Venus, Earth'),('CF074F','Electroforming','M',3,3,NULL,1,0,0,0,NULL),('CF074R','Impact Mold Sinter','M',3,5,NULL,0,0,0,0,'FOAMED NICKEL: -1 to Colocated size rolls.'),('CF071F','Fluidized Bed','V',3,4,NULL,1,0,0,0,NULL),('CF071R','Atmospheric Scoop','V',1,5,1,1,0,0,0,'SCOOP: If operational, this card makes adjacent or colocated aerostat sites into [2 hydration]'),('CF077F','Foamglass Sintering','D',3,4,NULL,1,0,0,0,NULL),('CF077R','Laser-Heated Pedestal Growth','D',1,5,NULL,1,0,0,0,'SUPERLENS: -1 to all Colocated raygun size rolls.'),('CF076F','Froth Flotation','D',3,5,NULL,1,0,0,0,NULL),('CF076R','Femtochemistry','D',2,8,NULL,0,0,0,0,'SCAVENGING: If Colocated, doubles FTs during site refuel.'),('CF075F','ISRU Sabatier','V',3,4,NULL,1,0,0,0,NULL),('CF075R','Biophytolytic Algal Farm','V',3,5,NULL,0,0,0,0,'COMET LICHEN: -2 to Colocated size rolls on D Sites.'),('CF078F','In-Situ Leaching','D',3,3,NULL,0,1,1,1,NULL),('CF078R','Termite Nest','D',1,3,NULL,0,1,1,1,'MINE REVIVAL: As an op, remove a busted disk and place Claim on a Colocated Site of Size 2+.'),('CF072F','Magma Electrolysis','V',3,3,NULL,1,0,0,0,NULL),('CF072R','Ionosphere Lasing','V',2,6,NULL,0,0,0,0,'IONOSAT: If used to industrialize an Atmospheric Site, permanently gain the Powersat faction privilege.'),('CF079F','Supercritical Drying','H',1,5,NULL,0,1,0,0,NULL),('CF079R','Solid Flame','H',0,5,NULL,0,1,0,0,'JELLYBOTS: Colocated industrialization is a free action.');
/*!40000 ALTER TABLE `hf_refineries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_robonauts`
--

DROP TABLE IF EXISTS `hf_robonauts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_robonauts` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `thrust` int(11) DEFAULT NULL,
  `fuel_consumption` varchar(4) DEFAULT NULL,
  `fuel_type` varchar(8) DEFAULT NULL,
  `afterburn` int(11) DEFAULT NULL,
  `push` int(11) DEFAULT NULL,
  `solar` int(11) DEFAULT NULL,
  `isru` int(11) DEFAULT NULL,
  `isru_missile` int(11) DEFAULT NULL,
  `isru_raygun` int(11) DEFAULT NULL,
  `isru_buggy` int(11) DEFAULT NULL,
  `generator_p` int(11) DEFAULT NULL,
  `generator_e` int(11) DEFAULT NULL,
  `reactor_x` int(11) DEFAULT NULL,
  `reactor_o` int(11) DEFAULT NULL,
  `reactor_b` int(11) DEFAULT NULL,
  `therms` int(11) DEFAULT NULL,
  `ability` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_robonauts`
--

LOCK TABLES `hf_robonauts` WRITE;
/*!40000 ALTER TABLE `hf_robonauts` DISABLE KEYS */;
INSERT INTO `hf_robonauts` VALUES ('CB063F','Blackbody-Pumped Laser','S',0,5,NULL,NULL,NULL,NULL,0,0,2,0,1,0,0,0,0,1,1,1,NULL),('CB063R','Fissile Aerosol Laser','S',0,7,NULL,NULL,NULL,NULL,0,0,2,0,1,0,0,0,0,0,0,1,NULL),('CB057F','Cat Fusion Z-pinch Torch','D',0,2,NULL,NULL,NULL,NULL,0,0,2,0,0,1,0,0,1,0,0,1,NULL),('CB057R','H-B Cat Inertial','D',2,2,4,'1/3','water',1,0,0,0,1,0,0,0,0,1,0,0,1,NULL),('CB059F','Flywheel Tractor','D',0,5,NULL,NULL,NULL,NULL,0,0,3,0,0,1,0,1,0,0,0,NULL,NULL),('CB059R','Electrophoretic Sandworm','D',1,5,NULL,NULL,NULL,NULL,0,0,1,0,0,1,0,0,0,0,0,NULL,NULL),('CB066F','Free Electron Laser','S',2,4,NULL,NULL,NULL,NULL,0,0,1,0,1,0,1,0,0,0,0,1,NULL),('CB066R','Wakefield e-Beam','S',0,5,4,'2','dirt',2,0,0,1,1,0,0,1,0,0,0,0,NULL,NULL),('CB060F','Kuck Mosquito','D',0,6,10,'8','water',2,0,0,3,1,0,0,0,0,0,0,1,NULL,NULL),('CB060R','Ablative Laser','D',0,6,3,'1','water',3,1,1,2,1,0,0,0,0,0,0,0,NULL,NULL),('CB062F','MET Steamer','C',1,4,5,'4','water',1,1,0,2,1,0,0,0,1,0,0,0,NULL,NULL),('CB062R','Nanobot','C',0,5,NULL,NULL,NULL,NULL,0,0,1,0,0,1,0,0,0,0,0,NULL,NULL),('CB056F','Neutral Beam','S',2,5,NULL,NULL,NULL,NULL,0,0,2,0,1,0,1,0,0,0,0,NULL,NULL),('CB056R','D-D Fusion Inertial','S',1,4,3,'1/2','water',1,0,0,1,1,0,0,1,0,0,0,0,2,NULL),('CB058F','Nuclear Drill','D',1,6,5,'4','water',1,1,0,3,1,0,0,0,0,0,1,0,NULL,NULL),('CB058R','Helical Railgun','D',2,8,5,'4','dirt',NULL,1,0,0,1,1,0,1,0,0,0,0,NULL,NULL),('CB067F','Phase-Locked Diode Laser','C',1,3,NULL,NULL,NULL,NULL,0,0,3,0,1,0,0,1,0,0,0,NULL,NULL),('CB067R','Lorentz-Propelled Microprobe','C',0,3,NULL,NULL,NULL,NULL,0,0,3,0,1,0,0,0,0,0,0,NULL,'NANITES: One re-roll if fail 1 or more size rolls.'),('CB061F','Rock Splitter','V',0,5,NULL,NULL,NULL,NULL,0,0,4,0,0,1,0,1,0,0,0,NULL,NULL),('CB061R','MagBeam','V',1,5,4,'1','water',1,1,1,3,1,1,0,0,0,0,0,0,NULL,'-1 ISRU, +3 thrust if pushed by Powersat.'),('CB065F','Solar-Pumped MHD Exciplex Laser','C',3,4,NULL,NULL,NULL,NULL,0,0,2,0,1,0,0,0,0,0,0,2,NULL),('CB065R','Quantum Cascade Laser','C',1,5,NULL,NULL,NULL,NULL,0,0,0,0,1,0,0,1,0,0,0,1,NULL),('CB064F','Tungsten Resistojet','M',0,5,5,'4','water',1,1,0,3,1,0,0,0,0,0,0,0,NULL,NULL),('CB064R','MITEE Arcjet','M',0,4,4,'2','water',2,1,0,1,1,0,0,0,1,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `hf_robonauts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hf_thrusters`
--

DROP TABLE IF EXISTS `hf_thrusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hf_thrusters` (
  `id` varchar(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `spectral_type` varchar(1) DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `rad_hard` int(11) DEFAULT NULL,
  `thrust` int(11) DEFAULT NULL,
  `fuel_consumption` varchar(4) DEFAULT NULL,
  `fuel_type` varchar(8) DEFAULT NULL,
  `bonus_pivots` int(11) DEFAULT NULL,
  `afterburn` int(11) DEFAULT NULL,
  `push` int(11) DEFAULT NULL,
  `solar` int(11) DEFAULT NULL,
  `generator_p` int(11) DEFAULT NULL,
  `generator_e` int(11) DEFAULT NULL,
  `reactor_x` int(11) DEFAULT NULL,
  `reactor_o` int(11) DEFAULT NULL,
  `reactor_b` int(11) DEFAULT NULL,
  `therms` int(11) DEFAULT NULL,
  `ability` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hf_thrusters`
--

LOCK TABLES `hf_thrusters` WRITE;
/*!40000 ALTER TABLE `hf_thrusters` DISABLE KEYS */;
INSERT INTO `hf_thrusters` VALUES ('CT052F','Ablative Plate','V',1,7,2,'2','water',0,1,1,0,0,0,1,0,1,NULL,NULL),('CT052R','Ablative Nozzle','V',0,8,3,'2','water',0,1,1,0,0,0,1,1,1,NULL,NULL),('CT046F','De Laval Nozzle','M',0,6,5,'4','water',0,2,0,0,0,0,0,1,1,NULL,NULL),('CT046R','Magnetic Nozzle','M',0,5,3,'1','water',0,3,0,0,0,0,0,1,0,NULL,NULL),('CT054F','Dumbo','S',0,7,6,'5','water',0,1,0,0,0,0,0,1,1,NULL,NULL),('CT054R','Timberwind','S',0,7,5,'3','water',0,1,0,0,0,0,1,1,1,NULL,NULL),('CT045F','Hall Effect','C',2,5,3,'2','water',0,NULL,1,0,0,1,0,0,0,NULL,NULL),('CT045R','Ion Drive','C',1,5,2,'1/2','water',1,1,1,0,0,1,0,0,0,NULL,NULL),('CT053F','Mass Driver','M',3,8,4,'3','dirt',0,NULL,1,0,1,0,0,0,0,NULL,NULL),('CT053R','MPD T-wave','M',1,9,2,'1/2','dirt',0,NULL,1,0,1,0,0,0,0,NULL,NULL),('CT044F','Metastable Helium','V',1,0,5,'1','water',0,1,0,0,0,0,1,0,0,1,NULL),('CT044R','n-6Li Microfission','V',1,8,5,'1/2','water',0,1,0,0,0,0,1,0,0,1,NULL),('CT051F','Monoatomic Plug Nozzle','M',0,6,4,'3','water',0,1,0,0,0,0,0,1,0,NULL,NULL),('CT051R','Vortex Confined Nozzle','M',0,7,4,'2','water',0,1,0,0,0,0,0,1,0,1,NULL),('CT050F','Photon Heliogyro','C',0,1,0,'0','water',1,NULL,1,1,0,0,0,0,0,NULL,'Aerobrake decommission. Immune to Flare & Belt Rolls.'),('CT050R','Electric Sail','C',0,2,2,'0','water',1,NULL,1,1,0,0,0,0,0,NULL,'Aerobrake decommission. Immune to Flare & Belt Rolls.'),('CT049F','Photon Kite Sail','C',0,0,0,'0','water',1,NULL,1,1,0,0,0,0,0,NULL,'Aerobrake decommission. Immune to Flare & Belt Rolls.'),('CT049R','Mag Sail','C',0,4,1,'0','water',1,NULL,1,1,0,0,0,0,0,NULL,'Aerobrake decommission. Each Radiation Belt entered = Bonus Burn'),('CT047F','Ponderomotive VASIMR','V',1,4,3,'1','water',0,1,1,0,1,0,0,0,0,NULL,NULL),('CT047R','Pulsed Plasmoid','V',1,5,3,'1','dirt',0,NULL,1,1,0,0,0,0,0,NULL,NULL),('CT055F','Pulsed Inductive','C',1,5,4,'2','water',0,NULL,1,0,1,0,0,0,0,NULL,NULL),('CT055R','Dual-Stage 4-Grid','C',0,5,2,'1/3','water',1,NULL,1,0,0,1,0,0,0,NULL,NULL),('CT048F','Re Solar Moth','D',0,5,3,'4','water',0,2,1,1,0,0,0,0,0,NULL,NULL),('CT048R','Colliding Beam H-B Fusion','D',2,5,3,'1/10','water',1,2,0,0,0,1,0,0,0,1,NULL);
/*!40000 ALTER TABLE `hf_thrusters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-09 17:46:43
