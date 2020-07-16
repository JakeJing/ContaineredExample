using DrWatson
@quickactivate "ContaineredExample"

using ExampleModule

x0 = 7

result = compute(x0);

params = @ntuple x0

tagsave(
        datadir("sims",savename("compute", params,"bson")),
        @dict params result
    )




