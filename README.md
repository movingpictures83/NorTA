# NorTA
# Language: R
# Input:  CSV (file of initial counts)
# Output: PREFIX (two files, one with correlations and the other with synthetic counts)
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: SpiecEasi_1.1.0

PluMA plugin that produces a synthetic set of samples and counts using the 
Normal To Anything (NorTA) method.

These counts are produced based on the initially supplied set of counts
in CSV format.  First correlations are computed on this initial set, then
the synthetic set of counts is assembled based on these correlations.

This can be useful for testing how well an algorithm performs across
multiple datasets with similar properties
