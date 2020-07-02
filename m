Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C821211E
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Jul 2020 12:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1226E038;
	Thu,  2 Jul 2020 10:25:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic302-2.consmr.mail.bf2.yahoo.com
 (sonic302-2.consmr.mail.bf2.yahoo.com [74.6.135.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AD06E038
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 Jul 2020 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1593685549; bh=ssuR219tc4zbcHmcubTL/XfCxjR+e0fxoJYqe5eUFts=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=g0xQT/l0AoC+gHM2vavHbkEAtW5hybIb9/SNk0Icy7S6iNKZGCvB+x4PgWVwZbSEBj87f4vmKNinA2O8YaGb+Z/8BT3dBXE9KxZHhiemvEVAbMQ5BWZ4KEvRW1f/c8jqoypjL1if4T5nqWMtL+H+DEjhjztXfvcTSluUPooHpvxSDUBFD1LjZlbP/8BOTQ9iSpFy8NeD3OFnG+3P3z8Iyxi8/2IthUTc7t+o07a8q7U4gQZbWKlTvSEBDyHZrHF8+oaPZP+NZB9FUibCPHK/dyEnjfMvJS8rqlmfaRo+eEcCJ/WlB3+ecMN0XBFPW9COVqWe1/cNLkC+4QNGuOGQ3Q==
X-YMail-OSG: Rkjq3XcVM1kVci0dair1.hf2HQ8ih2cQQ203.mMKGnJHoP.R8CgkzY3UOvJhsb5
 BGK6UsIc_w2ADP80LkZSzB29xTUaR0zphW5QWSgSf6ShfKfjqXpn_XbC4RxXYTWTDEGWV8oR9HHA
 M2kxjRzE6174cTkCE0RfmVYP9uk8nwQr1NCqlIcwjsd7_dLd1iZkfLF5KNaOinJ.6oNuQDsyz1N9
 LiHn8E6jcZnw.iXivJnHUv8nMi456jS.GXocij5rX4oNrxOLd1Ib_Nmr_KC7CGRSIEr4Ri663uOz
 Eh3ZBL7qwr6aiud2wKP4T8jxeScKULKf_VEzCF8YH_iNn9JmTtmFS7PoG3zlkJCiORBNE_x.LyUW
 bxR6TecPkd0oIDqSZe6JOS44fDR1p20aeTCYic2ogW0twh5dwGVDTsDRnmhFciUdkHEfzDaUpAH8
 zgS.0hHC7BRspUmKtygcTZNHhU03jv_u9HhZRpa8ds2vyH8tl52a9Zel5dKDr4MBYV0j6tPe5w4O
 d9jyN7G129R.Xne4PRaZVJOCBVQYcBQWbxBiDn_Og24n0HJG2aBzbmxKZpakTcumrOC.DhAlfQW8
 p3ikOPBeE_4FY04ggKZDDyBIMumj8j3GbwRqav_phMiUa4vOYdLL9pn5OU8HvRhFoMdtVI3a337p
 oJrYh.AaBX082bZ71BxGA62j0VSHlmIYpAeH5jTPBz7Syr8foqoX8SqgGbh6NKfsrHihfi.t42Zz
 vPBQ0U6ZxgX_pLsMa4lvHmCXNaVL0Is2Rm4ipUhPCVQ0J32kEC3Sz52jT2dLcVhMa9yw9A7udSNJ
 Yb9NS_XitBgH6o59sxSKc1e01FZHaObqagSXGiq5p3bujjBJ29NYKSBBFKmInTV3nW_XLSQMu6ol
 znSLgwqUhNH4Ti0o.sEub2ofGxmGlohmNtUgL5tStlWT13axksoX4Ss2fiZbQTtHYgSJLaEA64ur
 YwCUia7M7StssDSYiwq2Mn5Pxn39RHzaqDuvBSYEFtvbbKTKuOwC8IWBi6V0uJbY5aE4LaXgxwrq
 385TjL65ANHcFr9Q4gXrgoIxHRTqRgZC5usLtTottGliYomyMx.k_fQbaY9PNBRAjcQ3YzdY3Ref
 _L1kSlSxsgAE5HbZHwcmKroOpBlRr1Sq73WY4G09dbHaXTclxRZRP2lOVctJNR9lgkcihHB8UqBD
 P2C3upvGwN3eLjABEnLEeWgqBcU7LzBO2DZLftNCSI3hmqFu9bwO6GM1OzXK.gGQp4cNqjFW79ao
 ANDy7GLnuru_8QKbsgZE5DGswnUpmN1GNGrTlYeg7Oaj.auLDeZbQPvmQHMb9J6KDlDIESveqZ7k
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.bf2.yahoo.com with HTTP; Thu, 2 Jul 2020 10:25:49 +0000
Date: Thu, 2 Jul 2020 10:25:47 +0000 (UTC)
From: Marilis Mannik <mariliis.manniik@gmail.com>
Message-ID: <261303205.147601.1593685547154@mail.yahoo.com>
Subject: Urgent From Hospital
MIME-Version: 1.0
References: <261303205.147601.1593685547154.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16197 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116
 Safari/537.36
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
Reply-To: manniik.mariliis@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>



Hello My Beloved
this is Ms Marilis Mannik from Estonia writing from the hospital here in Ivory Coast;Dear I want you to know that I'm dying here in this hospital right now which i don't know if i will see some few days to come.

My Beloved, i was informed by my doctor that i got poisoned and it affected my liver and i can only live for some days. The reason why i contacted you today is because i know that my step mother wanted to kill me and take my inheritance from my late Father. I have a little adopted child named Andrew C. Mannik that i adopted in this Country when my late Father was alive and $3.5 million Dollars i inherited from my late father. My step mother and her children they are after Andrew right now because they found out that Andrew was aware of the poison, and because i handed the documents of the fund over to him the day my step Mother poisoned my food, for that reason they do not want Andrew to expose them, so they are doing everything possible to kill him.

My Beloved, please i want you to help him out of this country with the money, he is the only one taking good care of me here in this hospital right now and even this email you are reading now he is the one helping me out. I want you to get back to me so that he will give you the documents of the fund and he will direct you to a well known lawyer that i have appointed, the lawyer will assist you to change the documents of the fund to your name to enable the bank transfer the money to you..

This is the favor i need when you have gotten the fund:

(1) Keep 30% of the money for Andrew until he finish his studies to become a man as he has been there for me as my lovely Son and i promised to support him in life to become a medical Doctor because he always desire for it with the scholarship he had won so far. I want you to take him along with you to your country and establish him as your son.

(2) Give 20% of the money to handicap people and charity organization. The remaining 50% should be yours for your help to Andrew.

Note; This should be a code between you and my son Andrew in this transaction "Hospital" any mail from him, the Lawyer he will direct you to, without this code "Hospital" is not from the Andrew, the Lawyer or myself as i don't know what will happen to me in the next few hours.

Finally, write me back so that Andrew will send you his pictures to be sure of whom you are dealing with. Andrew is 14years now, therefore guide him. And if i don't hear from you i will look for another person or any organization.

May Almighty God bless you and use you to accomplish my wish. Pray for me always.
Ms Marilis Mannik
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
