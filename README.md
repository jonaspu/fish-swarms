Group Name: FiJoLu2048

Members: Jonas Purtschert, Luca Tondelli

## Simulating a fish swarm with and without enemies.



# General Introduction

In this paper we want to understand and investigate the behavior of a fish swarm. The swarm consists of a group of objects in which each object acts as an individual but also needs to cooperate with others to achieve their aim i.e not starve or become food of an enemy. We are interested in how they act in their given environment - with and without enemies. This can be seen as a simulation of swarms living in a natural environment and in an environment without natural enemies like an aquarium. We want to investigate the impact on the swarm behavior between those environments. We were motivated by documentary movies where the fishes stay close together and build a swarm to reduce the risk of getting eaten by a predator and also increase the time where each individual can search food. The knowledge of the individuals not to be scared of enemies in the artificial environment should cause a different behavior of the whole swarm.



# The Model

As a base model we take the “Artificial Fish Swarm Algorithm”, we will modify and extend it to make the fishes recognize enemies and react to them. (We are not sure about how we will extend and modify the algorithm right now, will be added later)
Artificial fish swarm algorithm: a survey of state-of-the-art, hybridization, combinatorial and indicative applications		Mehdi Neshat, Ghodrat Sepidnam, Mehdi Sargolzaei, Adel Najaran Toosi
A Hybrid of Artificial Fish Swarm Algorithm and Particle Swarm Optimization for Feedforward Neural Training		Huadong Chen, Shuzong Wang, Jingxi Li, Yunfan Li



# Fundamental Question

What influence does it have when changing some parameters of the AFSA?
What are the main differences between the fish swarm model with and without enemy modification?
 


# Expected Results

We expect a different behavior of the fish swarm when adding an enemy, but the same as AFSA without an enemy. We expect to have a better cooperation of the swarm to increase the chances of survive. We also expect the agents to stay closer to each when an enemy is present. Because of this we expect to have a totally different behavior and social cohesion of the swarm in the two environments.



# Research Methods

We are going to use MATLAB for modelling agent-based models of fish swarms, their enemy and their behavior. We use the existing AFSA and modify it.
