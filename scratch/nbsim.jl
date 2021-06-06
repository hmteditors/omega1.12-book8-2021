# To simulate the main computation that takes place
# in an MID validating notebook, run this script from
# the root directory of this repository.
using EditorsRepo
using CitableText
using CitableObject
using ManuscriptOrthography
using Orthography

reporoot = pwd()
repo = repository(reporoot)

## CATALOGING CHECKS:
cites = citation_df(repo)
filesmatch(repo, cites)

# ... document other functions listing discrepancies

## SURFACES FOR MENU
surfs = surfaces(repo)

surface = surfs[1]





## DSE RECORDS

sdse = surfaceDse(repo, surface)
# Use citableimage library to craft URLs to ICT2.

## DSE ACCURACY

row = sdse[1, :]
diplnodetext(repo, row.passage)

## ORTHOGRAPHY

textconfig = citation_df(repo)

tidy = EditorsRepo.baseurn(row.passage)

# Get the orthography
ortho = orthographyforurn(textconfig, tidy)
chunks = normednodetext(repo, row.passage) |> split

validstring(ortho, chunks[1])
