#ifndef __NODE_H
#define __NODE_H

/* Node Struct Definition */
struct Node {
    /* HOST VARIABLES BEGIN */
    // node identifier
    int   * inputOffsets;

    // node parameters
    int     nb;
    int     ni;
    int     ns;
    int     np;
    float   starvCoeff;
    float   alpha;
    float   beta;
    float   clustErr;

    int     winner;


    // node statistics
    float * mu;
    float * sigma;
    float * starv;
    
    // node beliefs
    float * input;
    float * beliefEuc;
    float * beliefMal;
    float * pBelief;
    /* HOST VARIABLES END */

    /* DEVICE VARIABLES BEGIN */
    struct CudaNode *node_dev;
    /* DEVICE VARIABLES END */
};

struct CudaNode {
    // node identifier
    int   * inputOffsets;

    // node parameters
    int     nb;
    int     ni;
    int     ns;
    int     np;
    float   starvCoeff;
    float   alpha;
    float   beta;
    float   clustErr;

    int     winner;

    // node statistics
    float * mu;
    float * sigma;
    float * starv;
    float * dist;
    
    // node beliefs
    float * input;
    float * beliefEuc;
    float * beliefMal;
    float * pBelief;
};
/* Node Struct Definition End */


/* Node Functions Begin */
void   InitNode(                        // initialize a node.
                 int,                   // node index
                 int,                   // belief dimensionality (# centroids)
                 int,                   // input dimensionality (# input values)
                 int,                   // parent belief dimensionality
                 float,                 // starvation coefficient
                 float,                 // alpha (mu step size)
                 float,                 // beta (sigma step size)
                 Node *,                // pointer node on host
                 CudaNode *,            // pointer to node on device
                 int *,                 // input offsets from input image (NULL for any non-input node)
                 float *,               // pointer to input on device
                 float *                // pointer to belief on device
                );

void DestroyNode(
                 Node *
                );

void CopyNodeToDevice(                  // copy node in host mem to device mem
                 Node *                 // node pointer
                );

void CopyNodeFromDevice(                // copy node from device mem to host mem
                 Node *                 // node pointer
                );

/* Node Node Functions End */

/* CUDA device function definitions */
//
__global__ void CalculateDistances(
                    CudaNode *,         // pointer to the list of nodes
                    float *             // pointer to the frame
                );

__global__ void NormalizeBelief(
                    CudaNode *          // pointer to the list of nodes
                );

__global__ void NormalizeBeliefGetWinner(
                    CudaNode *          // pointer to the list of nodes
                );

__global__ void UpdateWinner(
                    CudaNode *n,        // pointer to the list of nodes
                    float *framePtr     // pointer to the frame
                );

void cudaPrintMemory();

#endif
