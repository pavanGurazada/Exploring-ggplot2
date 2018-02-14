#' ---
#' title: "Plotting pretty graph structures"
#' author: Pavan Gurazada
#' date: "February 2018"
#' output: github_document
#' ---

library(tidygraph)
library(ggraph)
library(igraph)

set.seed(20130810)
theme_set(theme_bw())

#' An alternative to the adjacency matrix and edge-list representations is the 
#' tidygraph structure. It is a collection of two `tidy` data frames.

wghtdgraph <- as_tbl_graph(data.frame(from = sample(5, 20, TRUE),
                                      to = sample(5, 20, TRUE),
                                      weight = runif(20)))

unwghtdgraph <- as_tbl_graph(data.frame(from = sample(5, 20, TRUE),
                                        to = sample(5, 20, TRUE)))

ggraph(wghtdgraph, layout = 'circle') +
  geom_edge_link() +
  geom_node_text(aes(label = name)) +
  geom_node_point(size = 4, alpha = 0.1) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())
  
ggraph(wghtdgraph, 'matrix') + 
  geom_edge_point(mirror = TRUE) +
  theme_graph() + 
  coord_fixed()

graph <- create_notable('zachary') %>% 
  mutate(ranking = node_rank_leafsort())

ggraph(graph, 'matrix') + 
  geom_edge_point(mirror = TRUE) + 
  theme_graph() + 
  coord_fixed()
