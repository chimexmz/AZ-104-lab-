# Azure Landing Zone – Hub Network Architecture

## Overview
This document describes the Hub Network implemented as part of Phase 1 of the Azure Landing Zone.

The hub network provides centralized connectivity and shared services for all future application landing zones (spokes). It follows Microsoft Azure Landing Zone and hub-and-spoke networking best practices.

---

## Hub Network Purpose
The hub network is designed to:
- Act as the central connectivity point for spoke VNets
- Host shared services such as Bastion, gateways, and future security components
- Enable scalable and secure application onboarding

---

## Network Topology
- Architecture Pattern: Hub-and-Spoke
- Hub VNet Name: `vnet-hub`
- Address Space: `10.0.0.0/16`

---

## Subnets
| Subnet Name            | CIDR            | Purpose |
|------------------------|-----------------|---------|
| AzureBastionSubnet     | 10.0.1.0/26     | Secure administrative access |
| GatewaySubnet          | 10.0.2.0/27     | VPN / ExpressRoute gateway |
| SharedServicesSubnet   | 10.0.10.0/24    | Shared platform services |

---

## Deployment Model
- Infrastructure as Code: Bicep
- Scope: Dedicated Hub Resource Group
- Module-based deployment for reusability and scalability

---

## Current State
✅ Hub VNet deployed  
✅ Address space planned for future growth  
✅ Subnets created following Azure best practices  
✅ Outputs exposed for spoke peering  

---

## Next Phase
Phase 2 will introduce:
- Application Landing Zones (Spoke VNets)
- VNet peering between hub and spokes
- Network Security Groups (NSGs)
- User Defined Routes (UDRs)