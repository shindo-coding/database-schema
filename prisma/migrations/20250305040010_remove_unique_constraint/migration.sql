/*
  Warnings:

  - Added the required column `id` to the `WatchlistNotification` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `PriceWatchlistNotificationRealtime_code_key` ON `PriceWatchlistNotificationRealtime`;

-- DropIndex
DROP INDEX `StockWatchlist_code_key` ON `StockWatchlist`;

-- DropIndex
DROP INDEX `TickerSuggestion_code_key` ON `TickerSuggestion`;

-- DropIndex
DROP INDEX `TickerSuggestion_code_postId_userId_key` ON `TickerSuggestion`;

-- DropIndex
DROP INDEX `VolumeWatchlist_code_key` ON `VolumeWatchlist`;

-- DropIndex
DROP INDEX `VolumeWatchlistNotificationDaily_code_key` ON `VolumeWatchlistNotificationDaily`;

-- DropIndex
DROP INDEX `VolumeWatchlistNotificationRealtime_code_key` ON `VolumeWatchlistNotificationRealtime`;

-- DropIndex
DROP INDEX `WatchlistNotification_code_key` ON `WatchlistNotification`;

-- AlterTable
ALTER TABLE `WatchlistNotification` ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);
