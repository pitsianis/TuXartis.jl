```@meta
CurrentModule = TuXartis
```

# Technical description

```@contents
Pages = ["technical_description.md"]
Depth = 2:3
```

## Vertex/edge indices

#### Vertex indices  

 * degree
 * local cluster coefficient
 * degree centrality
 * neighbor degree centrality
 * neighbor embeddedness centrality 
 * hits
 * (Perron) eigenvectoror centrality 

#### Edge indices  

 * degree 
 * common neighbors (number of incident triangles)
 * Adamic-Adar [(definition)](@ref "Adamic-Adar definition")
 * Ricci curvature 
   - sublist
   - another item


## Spatial embedding

(low-dimensional real-valued vector representation) 

  * Embedding types
    + vertex embedding/vector representation
    + edge embedding
       - induced by vertex embedding
       - generated via line graph
       - vertex-edge twin-embedding
         ( a unification and a generalization ) 

  * Embedding properties (basic) 
    + adjacent vertices are closer to each other in the real-valued vector space
    + incident edges are closer to each other in he real-valued vector space 
      
  * Embedding methods
     + by force
     + via graph Laplacian
     + by SG-t-SNE
     + (add more)


## Histogram images on spatial maps
 
 (must demo an image of a bin on a map, one for vertices, one for edges) 
 
## Translation of histogram images


 o between two vertex maps 
 o between two edge maps 
 o between a vertex map and an edge map 

( must demo the image translation  ) 
