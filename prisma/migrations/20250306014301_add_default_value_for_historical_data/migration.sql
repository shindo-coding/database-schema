-- AlterTable
ALTER TABLE `HistoricalData` MODIFY `propTradingNetDealValue` INTEGER NOT NULL DEFAULT 0,
    MODIFY `propTradingNetPTValue` INTEGER NOT NULL DEFAULT 0,
    MODIFY `propTradingNetValue` INTEGER NOT NULL DEFAULT 0,
    MODIFY `sellForeignValue` DOUBLE NOT NULL DEFAULT 0,
    MODIFY `buyForeignValue` DOUBLE NOT NULL DEFAULT 0,
    MODIFY `currentForeignRoom` BIGINT NOT NULL DEFAULT 0,
    MODIFY `buyForeignQuantity` BIGINT NOT NULL DEFAULT 0,
    MODIFY `sellForeignQuantity` BIGINT NOT NULL DEFAULT 0;
