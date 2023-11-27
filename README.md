# H2 suboptimal leader-follower consensus control of multi-agent systems in 2023 International Federation of Automatic Control World Congress

This responsory includes the following files:
1. The paper "H2 suboptimal leader-follower consensus control of multi-agent systems "
2. Matlab Code for Simulation
3. Simulation Video

## Abstract:
In this paper, we investigate the distributed H2 suboptimal leader-follower consensus
control problem for linear multi-agent systems using dynamic output feedback. By considering
an autonomous leader, a number of followers, and an associated H2 cost functional, we aim to
design a distributed protocol to ensure that the leader-follower consensus is achieved while the
associated H2 cost is smaller than an a priori given upper bound. To this end, we first show that
the H2 suboptimal leader-follower consensus control problem can be equivalently derived as the
H2 suboptimal control problem of a set of independent systems. Based on this, we then present
a design method for computing a distributed protocol. The computation of the feedback gains
involves two Riccati inequalities whose dimension matches the state dimension of the agents. A
simulation example is provided to demonstrate the performance of the proposed protocol.

## Simulation Video
https://github.com/Yuan28082021/IFAC2023/assets/89707029/f765e8f5-73d3-4862-8e53-e9c7976a900e

## Slides in IFAC World Congress 2023, July 11, Yokohama, JAPAN 
[ifac2023.pdf](https://github.com/yuan2023-control/IFAC2023/blob/main/ifac2023.pdf)

## Reference
> @article{gao2023h2,
  title={H2 suboptimal leader-follower consensus control of multi-agent systems},
  author={Gao, Yuan and Jiao, Junjie and Hirche, Sandra},
  journal={IFAC-PapersOnLine},
  volume={56},
  number={2},
  pages={2614--2619},
  year={2023},
  publisher={Elsevier}
}
