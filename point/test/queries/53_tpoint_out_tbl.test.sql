﻿-------------------------------------------------------------------------------

SELECT asText(temp) FROM tbl_tgeompoint LIMIT 10;
SELECT asText(temp) FROM tbl_tgeogpoint LIMIT 10;
SELECT asText(temp) FROM tbl_tgeompoint3D LIMIT 10;
SELECT asText(temp) FROM tbl_tgeogpoint3D LIMIT 10;
SELECT k%90, asText(array_agg(g ORDER BY k)) FROM tbl_geography3D WHERE g IS NOT NULL GROUP BY k%90 ORDER BY k%90 LIMIT 10;
SELECT k%90, asText(array_agg(temp ORDER BY k)) FROM tbl_tgeogpoint3D WHERE temp IS NOT NULL GROUP BY k%90 ORDER BY k%90 LIMIT 10;

SELECT asEWKT(temp) FROM tbl_tgeompoint LIMIT 10;
SELECT asEWKT(temp) FROM tbl_tgeogpoint LIMIT 10;
SELECT asEWKT(temp) FROM tbl_tgeompoint3D LIMIT 10;
SELECT asEWKT(temp) FROM tbl_tgeogpoint3D LIMIT 10;
SELECT k%90, asEWKT(array_agg(g ORDER BY k)) FROM tbl_geography3D WHERE g IS NOT NULL GROUP BY k%90 ORDER BY k%90 LIMIT 10;
SELECT k%90, asEWKT(array_agg(temp ORDER BY k)) FROM tbl_tgeogpoint3D WHERE temp IS NOT NULL GROUP BY k%90 ORDER BY k%90 LIMIT 10;

-------------------------------------------------------------------------------
-- Combination of input/output functions

-- We need to add asewkt to avoid problems due to floating point precision
SELECT DISTINCT asewkt(fromEWKB(asEWKB(temp))) = asewkt(temp) FROM tbl_tgeompoint;
SELECT DISTINCT asewkt(fromMFJSON(asMFJSON(temp))) = asewkt(temp) FROM tbl_tgeompoint;

-------------------------------------------------------------------------------
