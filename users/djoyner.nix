{ config, pkgs, ... }:

{
  users.extraUsers.djoyner = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/djoyner";
    description = "David Joyner";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "$6$.erigt.skjT$0hMp2iF.tr5sttLbE2BNdniXnyx7UKTTigc9Oegokbjm/TXLIh4UBgyu/FzJvUalKH6L8L82xlO/1VKWx1aEA1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8BjaJs86sOr48XAumXu9wiPbsej/502GXFiNW8Nmxzn/urEbjcGPe3m3JdMoSblLKzxkDQeVLQT1EfHFTTlu4QJYyqgAtVlGUN8zNEGXjxjB/WQPAdlpy5EuJHvRUc30lUh2AgM3pG4CHcH1NHMnQn+fWktJA1s87Eu2QJ2gEid/iEbYFmKr2GEB+CCXynKBC0QBNLsvqI9rfp7C8FJ4MrlPHCMkGsqubr4HDLbG5F1mdCuqqlMY/AoifY5nf7cvNpfqYwLZKFlBZa4cAq3oBqXD1vZKo7MedmAd1FKUHQ46BxgJZ/IKTnxycmY+EALG4FSAyZKRJjq2jV+mdQpg5 david@joynerhome.net"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDayGNCl5WXWjGPTqLs2k6MPeDqB1P8EmP9efNFxRqxSsp1VeYrZ01Y7cWejPgXxOfNnkclMHgh0cHBhNJh8YtWy1+waxqfnDP4F8EQ2cjovr2mDzItvL9o3ius96bWY9D1HDuKKUOkJzcFHTTGtZdNZNUCVpY4eu4T9wMPiMa1DXlbdU1IRNwHJ4uYKJ0QTD4S8wUKkF/C0tQtm+L4H4YWLooHuoXlAZ3spIP+KPhjtEHQIqXxK7SJ6Dyj7DWbA7ErZ7iwPQRMJ6mFqyIpNLVthGPZ9wn6SiFojruK7hi2/aD+ONsuKlD9QhJ677FbFoBriZ7dl55vGATcbAtFpWrH david.joyner@spirent.com"
    ];
  };
}
