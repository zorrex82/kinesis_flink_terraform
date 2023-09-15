# Variaveis gerais

variable "region" {
  type = string

  default = "us_east_1"

}

# Variaveis para buckets

variable "bucket_log" {
  type = map(string)

  default = {
    "acl"  = "private",
    "name" = "log",
    "env"  = "dev",
  }

}


variable "bucket_raw" {
  type = map(string)

  default = {
    "acl"  = "private",
    "name" = "raw",
    "env"  = "dev",
  }

}

variable "bucket_code" {
  type = map(string)

  default = {
    "acl"  = "private",
    "name" = "code",
    "env"  = "dev",
  }

}

variable "kinesis_stream" {
  type = map(string)

  default = {
    "name" = "stream",
    "env"  = "dev"
  }

}

variable "kinesis_analytics" {
  type = map(string)

  default = {
    "name" = "analytics",
    "env"  = "dev"
  }

}

variable "kinesis_firehose" {
  type = map(string)

  default = {
    "name" = "firehose",
    "env"  = "dev"
  }

}

variable "glue_catalog_database" {
  type = map(string)

  default = {
    "name" = "database",
    "env"  = "dev"
  }

}

variable "glue_catalog_table" {
  type = map(string)

  default = {
    "name" = "table",
    "env"  = "dev"
  }
}

variable "table_columns" {
  type = list(object({
    name    = string
    type    = string
    comment = string
  }))
  default = [
    {
      "Name" : "bi_sdkcoo",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "bi_sddoco",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "bi_sddcto",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLNID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSFXO",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDMCU",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOKCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOORN",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOCTO",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOGNO",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRKCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRORN",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRCTO",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRLLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDMCT",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDMCS",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAN8",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSHAN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPA8",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDRQJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTRDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPDDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDADDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIVD",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCNDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDGL",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRSDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPEFJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPPDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDVR01",
      "Type" : "VARCHAR(50)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDVR02",
      "Type" : "VARCHAR(50)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDITM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLITM",
      "Type" : "VARCHAR(50)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAITM",
      "Type" : "VARCHAR(50)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLOCN",
      "Type" : "VARCHAR(40)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLOTN",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFRGD",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTHGD",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFRMP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTHRP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDEXDP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDSC1",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDSC2",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLNTY",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDNXTR",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLTTR",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDEMCU",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRLIT",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKTLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCPNT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRKIT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKTP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSRP1",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSRP2",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSRP3",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSRP4",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSRP5",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRP1",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRP2",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRP3",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRP4",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRP5",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUOM",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUORG",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSOQS",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSOBK",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSOCN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSONE",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUOPN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDQTYT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDQRLV",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCOMM",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOTQY",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUPRC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAEXP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAOPN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPROV",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTPC",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAPUM",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLPRC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUNCS",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDECST",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCSTO",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTCST",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDINMG",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPTC",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRYIN",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDTBS",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTRDC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFUN2",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDASN",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRGR",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCLVL",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCADC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDOC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDCT",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDODOC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDODCT",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOKC",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPSN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDELN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTAX1",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTXA1",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDEXR1",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDATXT",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRIO",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRESL",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDBACK",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSBAL",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAPTS",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLOB",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDEUSE",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDTYS",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDNTR",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDVEND",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCARS",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDMOT",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDROUT",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSTOP",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDZON",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCNID",
      "Type" : "VARCHAR(40)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFRTH",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSHCM",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSHCN",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSERN",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUOM1",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPQOR",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUOM2",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSQOR",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUOM4",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDITWT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDWTUM",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDITVL",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDVLUM",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRPRC",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDORPR",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDORP",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCMGP",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDGLC",
      "Type" : "VARCHAR(8)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCTRY",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFY",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO01",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO02",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO03",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO04",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO05",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO06",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO07",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO08",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO09",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO10",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO11",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO12",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO13",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO14",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO15",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDACOM",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCMCG",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRCD",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDGRWT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDGWUM",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSBL",
      "Type" : "VARCHAR(16)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSBLT",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDLCOD",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUPC1",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUPC2",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUPC3",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSWMS",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUNCD",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCRMD",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCRCD",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCRR",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFPRC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFUP",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFEA",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFUC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFEC",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDURCD",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDURDT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDURAT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDURAB",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDURRF",
      "Type" : "VARCHAR(30)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTORG",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUSER",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPID",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDJOBN",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUPMJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDTDAY",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO16",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO17",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO18",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO19",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSO20",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIR01",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIR02",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIR03",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIR04",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDIR05",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSOOR",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDVR03",
      "Type" : "VARCHAR(50)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDEID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPSIG",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRLNU",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPMDT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRLTM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRLDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDRQT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDADTM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOPTT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPDTT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPSTM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXDCK",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXPTY",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDUAL",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDBSC",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCBSC",
      "Type" : "VARCHAR(20)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCORD",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDVAN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPEND",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRFRV",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDMCLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSHPN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDRSDT",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRJM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOSEQ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDMERL",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDHOLD",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDHDBU",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDDMBU",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDBCRC",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDODLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOPDJ",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXKCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXORN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXCTO",
      "Type" : "VARCHAR(4)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXLLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDXSFX",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPOE",
      "Type" : "VARCHAR(12)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPMTO",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDANBY",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPMTN",
      "Type" : "VARCHAR(24)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDNUMB",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDAAID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSPATTN",
      "Type" : "VARCHAR(100)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRAN8",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPRCIDLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCCIDLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDSHCCIDLN",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOPPID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOSTP",
      "Type" : "VARCHAR(6)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDUKID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCATNM",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDALLOC",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDFULPID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDALLSTS",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOSCORE",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOSCOREO",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDCMCO",
      "Type" : "VARCHAR(10)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKITID",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKITAMTDOM",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKITAMTFOR",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDKITDIRTY",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOCITT",
      "Type" : "VARCHAR(2)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDOCCARDNO",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPMPN",
      "Type" : "VARCHAR(60)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "SDPNS",
      "Type" : "DECIMAL",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "change_seq",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "COL_timestamp",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "COL_recordtype",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "operation",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "COL_partitionkeytype",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "COL_schemaname",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    },
    {
      "Name" : "COL_tablename",
      "Type" : "VARCHAR(256)",
      "Comment" : "Comment about metadatas"
    }
  ]
}