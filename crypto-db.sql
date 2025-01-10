-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 10, 2025 la 11:02 PM
-- Versiune server: 10.4.32-MariaDB
-- Versiune PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `crypto-db`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `adresses`
--

CREATE TABLE `adresses` (
  `Adress_ID` int(255) NOT NULL,
  `Blockchain_ID` int(255) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `adresses`
--

INSERT INTO `adresses` (`Adress_ID`, `Blockchain_ID`, `Address`) VALUES
(1, 2, 'f42by3b4gy3h57gnfgxe21dsa@'),
(2, 1, 'm9ug349h8fcejhfvwefe$wnty235'),
(3, 3, 'fn2478f432cristir423873ewnc'),
(4, 4, 'nkxjsq187321cumnd213on8nscdbshjdme7812g132'),
(5, 5, 'vids`12210021dmscnxszn234vcsx');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `blockchain`
--

CREATE TABLE `blockchain` (
  `Blockchain_ID` int(255) NOT NULL,
  `Fee_ID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `blockchain`
--

INSERT INTO `blockchain` (`Blockchain_ID`, `Fee_ID`, `Name`) VALUES
(1, 1, 'Bnb'),
(2, 2, 'Arbitrum'),
(3, 3, 'Stellar'),
(4, 4, 'Cronos'),
(5, 5, 'Ripple');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cryptocurrencies`
--

CREATE TABLE `cryptocurrencies` (
  `Crypto_ID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` int(255) NOT NULL,
  `Launch Date` date NOT NULL,
  `Blockchain Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `cryptocurrencies`
--

INSERT INTO `cryptocurrencies` (`Crypto_ID`, `Name`, `Price`, `Launch Date`, `Blockchain Type`) VALUES
(1, 'Solana', 3, '2016-12-16', 'PoS Blockchain'),
(2, 'Bitcoin', 99000, '2015-02-15', 'PoW Blockchain'),
(3, 'Ethereum', 3000, '2017-10-16', 'PoS Blockchain'),
(4, 'Doge', 1, '2022-03-26', 'Litecoin Blockchain'),
(5, 'Avax', 52, '2019-08-16', 'Avalanche Blockchain'),
(6, 'Litecoin', 514, '2011-10-07', 'P2P Blockchain');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cryptoonplatform`
--

CREATE TABLE `cryptoonplatform` (
  `ID` int(255) NOT NULL,
  `Platform_ID` int(255) NOT NULL,
  `Crypto_ID` int(255) NOT NULL,
  `Price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `cryptoonplatform`
--

INSERT INTO `cryptoonplatform` (`ID`, `Platform_ID`, `Crypto_ID`, `Price`) VALUES
(1, 1, 3, 9500),
(2, 2, 5, 4250),
(3, 3, 4, 3800),
(4, 4, 1, 1984),
(5, 5, 2, 150000);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `fee`
--

CREATE TABLE `fee` (
  `Fee_ID` int(255) NOT NULL,
  `Amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `fee`
--

INSERT INTO `fee` (`Fee_ID`, `Amount`) VALUES
(1, 2500),
(2, 33),
(3, 100),
(4, 5000),
(5, 840);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `launch pools`
--

CREATE TABLE `launch pools` (
  `Launch_ID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Release Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `launch pools`
--

INSERT INTO `launch pools` (`Launch_ID`, `Name`, `Release Date`) VALUES
(1, 'Usual', '2024-12-10'),
(2, 'SCR', '2024-12-14'),
(3, 'Cati', '2024-12-17'),
(4, 'Bara', '2024-12-20'),
(5, 'NOT', '2024-12-26');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `loan interest`
--

CREATE TABLE `loan interest` (
  `Interest_ID` int(255) NOT NULL,
  `Loan_ID` int(255) NOT NULL,
  `Percentage` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `loan interest`
--

INSERT INTO `loan interest` (`Interest_ID`, `Loan_ID`, `Percentage`) VALUES
(1, 1, 5),
(2, 2, 2),
(3, 3, 10),
(4, 4, 13),
(5, 5, 8);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `loans`
--

CREATE TABLE `loans` (
  `Loan_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Platform_ID` int(255) NOT NULL,
  `Amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `loans`
--

INSERT INTO `loans` (`Loan_ID`, `User_ID`, `Platform_ID`, `Amount`) VALUES
(1, 1, 2, 150),
(2, 2, 3, 1000),
(3, 3, 4, 3590),
(4, 4, 5, 1989),
(5, 5, 1, 2024);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `owned crypto`
--

CREATE TABLE `owned crypto` (
  `ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Crypto_ID` int(255) NOT NULL,
  `Amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `owned crypto`
--

INSERT INTO `owned crypto` (`ID`, `User_ID`, `Crypto_ID`, `Amount`) VALUES
(1, 2, 5, 3011),
(2, 4, 4, 5000),
(3, 1, 3, 5),
(4, 3, 2, 2),
(5, 5, 1, 1000),
(8, 2, 1, 650),
(9, 1, 4, 1000);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `platforms`
--

CREATE TABLE `platforms` (
  `Platform_ID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Founding Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `platforms`
--

INSERT INTO `platforms` (`Platform_ID`, `Name`, `Founding Date`) VALUES
(1, 'Binance', '2016-12-28'),
(2, 'KuCoin', '2018-06-19'),
(3, 'Gate.io', '2015-07-18'),
(4, 'CoinBase', '2020-09-02'),
(5, 'Crypto.com', '2018-12-19');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `proposals`
--

CREATE TABLE `proposals` (
  `Proposal_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Date` date NOT NULL,
  `Content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `proposals`
--

INSERT INTO `proposals` (`Proposal_ID`, `User_ID`, `Date`, `Content`) VALUES
(1, 1, '2018-02-15', 'Add 2FA'),
(2, 2, '2021-10-05', 'Make the platform easier to access'),
(3, 3, '2018-07-14', 'Make the application on the phone'),
(4, 4, '2016-12-30', 'Add more coins'),
(5, 5, '2019-08-14', 'More options for trading');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `security logs`
--

CREATE TABLE `security logs` (
  `Security_ID` int(255) NOT NULL,
  `Contract_ID` int(255) NOT NULL,
  `Validity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `security logs`
--

INSERT INTO `security logs` (`Security_ID`, `Contract_ID`, `Validity`) VALUES
(1, 1, 'Avalaible for 1 year'),
(2, 2, 'Avalaible for 2 years'),
(3, 5, 'Avalaible for 3 years'),
(4, 3, 'Avalaible for 4 years'),
(5, 4, 'Avalaible for 5 years');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `smart contracts`
--

CREATE TABLE `smart contracts` (
  `Contract_ID` int(255) NOT NULL,
  `Transaction_ID` int(255) NOT NULL,
  `Adress_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `smart contracts`
--

INSERT INTO `smart contracts` (`Contract_ID`, `Transaction_ID`, `Adress_ID`, `User_ID`, `Notes`) VALUES
(1, 1, 1, 5, 'Due to renew in 2025'),
(2, 2, 5, 3, 'Due to renew in 2026'),
(3, 3, 2, 1, 'Due to renew in 2028'),
(4, 4, 4, 2, 'Due to renew in 2029'),
(5, 5, 3, 4, 'Due to renew in 2027');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `stake interest`
--

CREATE TABLE `stake interest` (
  `Interest_ID` int(255) NOT NULL,
  `Staking_ID` int(255) NOT NULL,
  `Percentage` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `stake interest`
--

INSERT INTO `stake interest` (`Interest_ID`, `Staking_ID`, `Percentage`) VALUES
(1, 1, 5),
(2, 2, 10),
(3, 3, 8),
(4, 4, 13),
(5, 5, 7);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `staking pools`
--

CREATE TABLE `staking pools` (
  `Staking_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Crypto_ID` int(255) NOT NULL,
  `Amount Deposited` int(255) NOT NULL,
  `Interest` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `staking pools`
--

INSERT INTO `staking pools` (`Staking_ID`, `User_ID`, `Crypto_ID`, `Amount Deposited`, `Interest`) VALUES
(1, 1, 2, 2500, 15),
(2, 2, 3, 100, 18),
(3, 3, 4, 2000, 8),
(4, 4, 5, 3000, 10),
(5, 5, 1, 1500, 5);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `staking rewards`
--

CREATE TABLE `staking rewards` (
  `Reward_ID` int(255) NOT NULL,
  `Staking_ID` int(255) NOT NULL,
  `Amount Generated` varchar(255) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `staking rewards`
--

INSERT INTO `staking rewards` (`Reward_ID`, `Staking_ID`, `Amount Generated`, `Date`) VALUES
(1, 1, '20', '2024-11-30'),
(2, 2, '25', '2021-08-28'),
(3, 3, '30', '2022-07-03'),
(4, 4, '35', '2024-07-27'),
(5, 5, '50', '2023-09-08');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `transactions`
--

CREATE TABLE `transactions` (
  `Transaction_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Fee_ID` int(255) NOT NULL,
  `Platform_ID` int(255) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `transactions`
--

INSERT INTO `transactions` (`Transaction_ID`, `User_ID`, `Fee_ID`, `Platform_ID`, `Date`) VALUES
(1, 5, 1, 1, '2018-12-17'),
(2, 4, 2, 2, '2024-04-01'),
(3, 3, 3, 3, '2023-10-12'),
(4, 2, 4, 4, '2023-09-04'),
(5, 1, 5, 5, '2024-07-19');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `user`
--

CREATE TABLE `user` (
  `User_ID` int(255) NOT NULL,
  `Profile_Info` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Funds` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `user`
--

INSERT INTO `user` (`User_ID`, `Profile_Info`, `Name`, `Password`, `Funds`) VALUES
(1, 'New Invester', 'Alin', '1234', 34000),
(2, 'Intermediate Invester', 'Cristi', '1234', 5626),
(3, 'Crypto Bro', 'Adrian', '', 0),
(4, 'Millionaire', 'Zein', '', 0),
(5, 'Wolf of the Wall Street', 'Alessia', '', 0),
(6, 'Trader', 'marshall', '1234!', 999),
(7, 'Begginer trader', 'max', '1234', 110),
(9, 'dog lover', 'alex', '1234', 999);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `votes`
--

CREATE TABLE `votes` (
  `Vote_ID` int(255) NOT NULL,
  `Proposal_ID` int(255) NOT NULL,
  `Date` date NOT NULL,
  `Amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `votes`
--

INSERT INTO `votes` (`Vote_ID`, `Proposal_ID`, `Date`, `Amount`) VALUES
(1, 1, '2016-02-05', 1800),
(2, 2, '2018-12-12', 950),
(3, 3, '2021-05-22', 400),
(4, 4, '2022-12-31', 500),
(5, 5, '2017-09-23', 3400);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `wallet`
--

CREATE TABLE `wallet` (
  `Wallet_ID` int(255) NOT NULL,
  `User_ID` int(255) NOT NULL,
  `Adress_ID` int(255) NOT NULL,
  `Seed Phrase` varchar(255) NOT NULL,
  `Crypto Amount` int(255) NOT NULL,
  `Wallet Type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `wallet`
--

INSERT INTO `wallet` (`Wallet_ID`, `User_ID`, `Adress_ID`, `Seed Phrase`, `Crypto Amount`, `Wallet Type`) VALUES
(1, 1, 2, 'man vessel salon sword decrease eyebrow citizen cable secret frozen float oak', 12000, 'Cold Wallet'),
(2, 2, 3, 'sign column imitate woman wall garage monitor oxygen about promote citizen summer', 31000, 'Web Wallet'),
(3, 3, 5, 'bicycle wear motor ugly travel duty grocery zebra mobile never album outer', 42000, 'Hot Wallet'),
(4, 4, 4, 'message frozen arrange dignity tattoo treat raise noodle drill venue vicious flight', 300, 'Trust Wallet'),
(5, 5, 1, 'leader common crowd canoe forum slender taste salad thumb distance garbage sauce', 9999, 'Mobile Wallet');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`Adress_ID`),
  ADD KEY `FK` (`Blockchain_ID`);

--
-- Indexuri pentru tabele `blockchain`
--
ALTER TABLE `blockchain`
  ADD PRIMARY KEY (`Blockchain_ID`),
  ADD KEY `FK23` (`Fee_ID`);

--
-- Indexuri pentru tabele `cryptocurrencies`
--
ALTER TABLE `cryptocurrencies`
  ADD PRIMARY KEY (`Crypto_ID`);

--
-- Indexuri pentru tabele `cryptoonplatform`
--
ALTER TABLE `cryptoonplatform`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK1` (`Platform_ID`),
  ADD KEY `FK2` (`Crypto_ID`);

--
-- Indexuri pentru tabele `fee`
--
ALTER TABLE `fee`
  ADD PRIMARY KEY (`Fee_ID`);

--
-- Indexuri pentru tabele `launch pools`
--
ALTER TABLE `launch pools`
  ADD PRIMARY KEY (`Launch_ID`);

--
-- Indexuri pentru tabele `loan interest`
--
ALTER TABLE `loan interest`
  ADD PRIMARY KEY (`Interest_ID`),
  ADD KEY `FK3` (`Loan_ID`);

--
-- Indexuri pentru tabele `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`Loan_ID`),
  ADD KEY `FK4` (`Platform_ID`),
  ADD KEY `FK5` (`User_ID`);

--
-- Indexuri pentru tabele `owned crypto`
--
ALTER TABLE `owned crypto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK6` (`Crypto_ID`),
  ADD KEY `FK7` (`User_ID`);

--
-- Indexuri pentru tabele `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`Platform_ID`);

--
-- Indexuri pentru tabele `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`Proposal_ID`),
  ADD KEY `FK8` (`User_ID`);

--
-- Indexuri pentru tabele `security logs`
--
ALTER TABLE `security logs`
  ADD PRIMARY KEY (`Security_ID`),
  ADD KEY `FK9` (`Contract_ID`);

--
-- Indexuri pentru tabele `smart contracts`
--
ALTER TABLE `smart contracts`
  ADD PRIMARY KEY (`Contract_ID`),
  ADD KEY `FK10` (`Adress_ID`),
  ADD KEY `FK11` (`Transaction_ID`),
  ADD KEY `FK12` (`User_ID`);

--
-- Indexuri pentru tabele `stake interest`
--
ALTER TABLE `stake interest`
  ADD PRIMARY KEY (`Interest_ID`),
  ADD KEY `FK13` (`Staking_ID`);

--
-- Indexuri pentru tabele `staking pools`
--
ALTER TABLE `staking pools`
  ADD PRIMARY KEY (`Staking_ID`),
  ADD KEY `FK14` (`Crypto_ID`),
  ADD KEY `FK15` (`User_ID`);

--
-- Indexuri pentru tabele `staking rewards`
--
ALTER TABLE `staking rewards`
  ADD PRIMARY KEY (`Reward_ID`),
  ADD KEY `FK16` (`Staking_ID`);

--
-- Indexuri pentru tabele `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `FK17` (`Fee_ID`),
  ADD KEY `FK18` (`Platform_ID`),
  ADD KEY `FK19` (`User_ID`);

--
-- Indexuri pentru tabele `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexuri pentru tabele `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`Vote_ID`),
  ADD KEY `FK20` (`Proposal_ID`);

--
-- Indexuri pentru tabele `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`Wallet_ID`),
  ADD KEY `FK21` (`Adress_ID`),
  ADD KEY `FK22` (`User_ID`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `adresses`
--
ALTER TABLE `adresses`
  MODIFY `Adress_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `blockchain`
--
ALTER TABLE `blockchain`
  MODIFY `Blockchain_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `cryptocurrencies`
--
ALTER TABLE `cryptocurrencies`
  MODIFY `Crypto_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `cryptoonplatform`
--
ALTER TABLE `cryptoonplatform`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `fee`
--
ALTER TABLE `fee`
  MODIFY `Fee_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `launch pools`
--
ALTER TABLE `launch pools`
  MODIFY `Launch_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `loan interest`
--
ALTER TABLE `loan interest`
  MODIFY `Interest_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `loans`
--
ALTER TABLE `loans`
  MODIFY `Loan_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `owned crypto`
--
ALTER TABLE `owned crypto`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `platforms`
--
ALTER TABLE `platforms`
  MODIFY `Platform_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `proposals`
--
ALTER TABLE `proposals`
  MODIFY `Proposal_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pentru tabele `security logs`
--
ALTER TABLE `security logs`
  MODIFY `Security_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `smart contracts`
--
ALTER TABLE `smart contracts`
  MODIFY `Contract_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `stake interest`
--
ALTER TABLE `stake interest`
  MODIFY `Interest_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `staking pools`
--
ALTER TABLE `staking pools`
  MODIFY `Staking_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `staking rewards`
--
ALTER TABLE `staking rewards`
  MODIFY `Reward_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `transactions`
--
ALTER TABLE `transactions`
  MODIFY `Transaction_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `votes`
--
ALTER TABLE `votes`
  MODIFY `Vote_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `wallet`
--
ALTER TABLE `wallet`
  MODIFY `Wallet_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `FK` FOREIGN KEY (`Blockchain_ID`) REFERENCES `blockchain` (`Blockchain_ID`);

--
-- Constrângeri pentru tabele `blockchain`
--
ALTER TABLE `blockchain`
  ADD CONSTRAINT `FK23` FOREIGN KEY (`Fee_ID`) REFERENCES `fee` (`Fee_ID`);

--
-- Constrângeri pentru tabele `cryptoonplatform`
--
ALTER TABLE `cryptoonplatform`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`Platform_ID`) REFERENCES `platforms` (`Platform_ID`),
  ADD CONSTRAINT `FK2` FOREIGN KEY (`Crypto_ID`) REFERENCES `cryptocurrencies` (`Crypto_ID`);

--
-- Constrângeri pentru tabele `loan interest`
--
ALTER TABLE `loan interest`
  ADD CONSTRAINT `FK3` FOREIGN KEY (`Loan_ID`) REFERENCES `loans` (`Loan_ID`);

--
-- Constrângeri pentru tabele `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `FK4` FOREIGN KEY (`Platform_ID`) REFERENCES `platforms` (`Platform_ID`),
  ADD CONSTRAINT `FK5` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `owned crypto`
--
ALTER TABLE `owned crypto`
  ADD CONSTRAINT `FK6` FOREIGN KEY (`Crypto_ID`) REFERENCES `cryptocurrencies` (`Crypto_ID`),
  ADD CONSTRAINT `FK7` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `FK8` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `security logs`
--
ALTER TABLE `security logs`
  ADD CONSTRAINT `FK9` FOREIGN KEY (`Contract_ID`) REFERENCES `smart contracts` (`Contract_ID`);

--
-- Constrângeri pentru tabele `smart contracts`
--
ALTER TABLE `smart contracts`
  ADD CONSTRAINT `FK10` FOREIGN KEY (`Adress_ID`) REFERENCES `adresses` (`Adress_ID`),
  ADD CONSTRAINT `FK11` FOREIGN KEY (`Transaction_ID`) REFERENCES `transactions` (`Transaction_ID`),
  ADD CONSTRAINT `FK12` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `stake interest`
--
ALTER TABLE `stake interest`
  ADD CONSTRAINT `FK13` FOREIGN KEY (`Staking_ID`) REFERENCES `staking pools` (`Staking_ID`);

--
-- Constrângeri pentru tabele `staking pools`
--
ALTER TABLE `staking pools`
  ADD CONSTRAINT `FK14` FOREIGN KEY (`Crypto_ID`) REFERENCES `cryptocurrencies` (`Crypto_ID`),
  ADD CONSTRAINT `FK15` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `staking rewards`
--
ALTER TABLE `staking rewards`
  ADD CONSTRAINT `FK16` FOREIGN KEY (`Staking_ID`) REFERENCES `staking pools` (`Staking_ID`);

--
-- Constrângeri pentru tabele `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `FK17` FOREIGN KEY (`Fee_ID`) REFERENCES `fee` (`Fee_ID`),
  ADD CONSTRAINT `FK18` FOREIGN KEY (`Platform_ID`) REFERENCES `platforms` (`Platform_ID`),
  ADD CONSTRAINT `FK19` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constrângeri pentru tabele `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `FK20` FOREIGN KEY (`Proposal_ID`) REFERENCES `proposals` (`Proposal_ID`);

--
-- Constrângeri pentru tabele `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `FK21` FOREIGN KEY (`Adress_ID`) REFERENCES `adresses` (`Adress_ID`),
  ADD CONSTRAINT `FK22` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
