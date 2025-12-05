// This file has the types to which all the data from various sources will be converted into

// Blacklisted - IPs

export interface BlacklistedIPs {
  ip: string;
  country: string;
  last_active: string;
}

// Attack Events

export type SeverityLevelType = "LOW" | "MEDIUM" | "HIGH" | "UNKNOWN";
export type AttackType =
  | "DDOS"
  | "VIRUS"
  | "MALWARE"
  | "PHISHING"
  | "UNKNOWN"
  | "SCANNING";

export interface AttackEventsWithIP {
  ip_address: string;

  source_longitude: number;
  source_latitude: number;

  destination_longitude: number;
  destination_latitude: number;

  attack_type: AttackType;
  severity_level: SeverityLevelType;

  autonomouse_system_number: number;
  autonomouse_system_organization: string;

  last_active: string;

  country: string;
}

export interface IPandActivity {
  ip_address: string;
  last_active: string;
}

export interface Attacks {
  source_country: string;
  source_latitude: number;
  source_longitude: number;

  destination_country: string;
  destination_latitude: number;
  destination_longitude: number;

  attack_type: AttackType;
  severity_level: SeverityLevelType;
}
