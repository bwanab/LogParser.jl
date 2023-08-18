using LogParser, Test, GZip, CSV, DataFrames

#Read in gzipped file
jbapachecombined = CSV.read(joinpath(dirname(@__FILE__), "data", "juliabloggers-apachecombined.gz"), delim='\t', skipto=1, DataFrame)

#Parse file
jbparsed = parseapachecombined.(jbapachecombined[!, :Column1])

#Test that array is 122,143 elements long
@test size(jbparsed)[1] == 122143

#Test that array is of type Array{ApacheLog,1}
@test typeof(jbparsed) == Vector{ApacheLog}

#Test DataFrame method
jbparsed_df = DataFrame(jbparsed)

#Test that a DataFrame was returned
@test typeof(jbparsed_df) <: DataFrame

#Test that DataFrame is 122143x9
@test size(jbparsed_df) == (122143,9)
