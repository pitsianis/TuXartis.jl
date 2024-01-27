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

 * degree [(definition)](@ref "Vertex degree")
 * local cluster coefficient [(definition)](@ref "Local cluster coefficient")
 * degree centrality
 * neighbor degree centrality
 * neighbor embeddedness centrality 
 * hits [(definition)](@ref "hits")
 * (Perron) eigenvector centrality [(definition)](@ref "(Perron) eigenvector centrality")

#### Edge indices  

 * degree [(definition)](@ref "Edge degree")
 * common neighbors (number of incident triangles) [(definition)](@ref "Common neighbors")
 * Adamic-Adar [(definition)](@ref "Adamic-Adar index")
 * Ricci curvature  [(definition)](@ref "Ricci curvature")
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
