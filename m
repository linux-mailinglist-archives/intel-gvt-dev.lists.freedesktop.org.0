Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F1263E41
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 09:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8B689F8E;
	Thu, 10 Sep 2020 07:14:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1591 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 07:14:29 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F689F8E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=nfhipAdYe7QosfYZArQIEaPTCfPpIsgdfra6kBaif9k=; b=TQF8mJL5ait+7M9kYZCsZis+bF
 Y006qdH6pa1nzXQcQfjZr7IekeivXBFuY1llgbmwdowzTGa2JfNyH0Ed66o2BhDqM5sXGPDGaSDAU
 fquIVxJ5YkI+zi2c+VFMLGIS6bf+oFpezhhEe8sWt8RUiRSPgr4hccSQDgY/70GCJud3uBgIp9vL9
 +qG/M46dprOY2k4GDZfmr2c6lcuxCM4fQPTDJBfzeXyIhAR3vtkpw4qn1fohj4r2xU1wNCyHAH7d3
 sDvqWyUJI1yt1Fog8mKUABdTCK0dE8LoFTPlIgI1SM+/CSdpm1s17fQrUb1u7xJr1NT0qDHvmQ2Ra
 EWk3J44g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <thomas.prescher@cyberus-technology.de>)
 id 1kGGN9-0007RC-U1; Thu, 10 Sep 2020 08:47:55 +0200
Received: from [2003:d4:df0a:2851:3602:86ff:fe6c:d086]
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <thomas.prescher@cyberus-technology.de>)
 id 1kGGN9-000MIy-PM; Thu, 10 Sep 2020 08:47:55 +0200
Subject: Re: Night Color not working in guests
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>
References: <65f0f6f8995ea6431b25d74fd6562f331f255317.camel@cyberus-technology.de>
 <20200910054209.GL28614@zhen-hp.sh.intel.com>
From: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Autocrypt: addr=thomas.prescher@cyberus-technology.de; prefer-encrypt=mutual; 
 keydata=
 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
 QEyvRUcWdcfTLXk8QhazU0/BFA==
Organization: Cyberus Technology GmbH
Message-ID: <df9e3be3-aa04-415c-bcb6-aa3c34180dbb@cyberus-technology.de>
Date: Thu, 10 Sep 2020 08:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200910054209.GL28614@zhen-hp.sh.intel.com>
Content-Language: en-US
X-Authenticated-Sender: thomas.prescher@cyberus-security.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25925/Wed Sep  9 15:48:50 2020)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi,

I don't know exactly what these functions are depending on, but it is
basically the same as nightshift for Windows 10 [1] where your entire
display image gets shifted to yellow. See an example in the link below.

All the best,
Thomas

[1]
https://support.microsoft.com/en-us/help/4027563/windows-10-set-your-displa=
y-for-night-time

On 9/10/20 7:42 AM, Zhenyu Wang wrote:
> On 2020.09.09 10:58:38 +0200, Julian Stecklina wrote:
>> Hello everyone,
>>
>> we noticed that any of the Night Color modes in Gnome and KDE don't work=
 in
>> guests when they run with vGPUs. This is pretty easy to reproduce: Pick =
a GNOME
>> or KDE Live CD and try to enable Night Color (KDE) or Night Light (GNOME=
).
>>
>> This is a bit of a minor issue, but I wonder what would be missing to ma=
ke this
>> work. Is there anything missing in Qemu or this is something that the me=
diator
>> needs to handle. Does anyone have an idea?
>>
> I personally don't use KDE and little with GNOME. What's function those n=
ight modes
> depend on? Display gamma config or something else?
>
-- =

Thomas Prescher
Architekt

Telefon: +49 1578 848 8649

Cyberus Technology GmbH
Altmarkt 10 C
01067 Dresden

Gesch=E4ftsf=FChrer: Tor Lund-Larsen, Sitz der Gesellschaft: Dresden
Amtsgericht Dresden, HRB 36753

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
