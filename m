Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4641E5D55
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 May 2020 12:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C899E6E169;
	Thu, 28 May 2020 10:45:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic302-48.consmr.mail.ne1.yahoo.com
 (sonic302-48.consmr.mail.ne1.yahoo.com [66.163.186.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668F6E169
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 May 2020 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590662719; bh=4O3o0uauLsEuPy5Ff2pUbyJDyVnk3a5yz2aOkP0JSJA=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=iiFuUtQnMKmpNbxE6Ra/Vf9g7EvT2qVYcViwiytz1plFmLy4k2j9sdQQPqNqPg4ijE1IjuQi6c5j7oqZPrP/8vIjXndgy1xb/RoPHw2cq/R3cZd1qbJcCd/rMmbEK2P3yc9k5R1wJMYbPmGyW4IspOsncy811b39X5PFqlCtkDxLV6E1p/ScwE+VRyYIarz8KCFBvUMN7XzvuO1+cnbJdaxNQ9wCneanv738ij9go0hzDoxgVvO7K3qJtmiKX6CWJ3eaLfzgw1hc3GE1RkrQjYyHGPgMmfMstFC+FsCyMD9dc/6FgWMQoBTIpf6+7U5tmQG5Geq2rOd6OnEz8MK6Tw==
X-YMail-OSG: JD.TDxAVM1nH1EKYfVIA8bXjg14u09awHnRNIy49ITmOCUsRz34oCwZKDFe.cKb
 zigcQwhDUSzI20bE.JHx_.MDKErZnwv7Fet38jAz7hpNCjSOKr6fevwqQF3USNX0KBPyRBN2n1km
 xHfNOx7w8HV2Ha3mWSb7gGifEYNSPI5Vb9j53reMelusRj3ej6YXm2mjdNSLrRliTir2lcb58R5t
 MIVpiAEW3bELdY85rxRzGXN4JnO7gbB_WUulIrKZNVJIYtflwdGGmhhKyhLfgjmzxqOqJun4dJiH
 dlmxeZC24d1W3tBqPzAboPjd9T9XwpBq.kSGT2dRZzjOfqtHaaLGKalSQfwiHnHMekuMn9kFYBlK
 NMrwm9KU8hnPJEneuzr_XCq.2Xw12Zftfz8NCKqDkLTO1HZEY_J9T3LQqkpEjbHeyxTXn.KDiDXI
 5.crxIaaiBtTT6JwfSwwBPZF6057DGVBUQ381IbspI_0xIZXHuRifAjqI2W_fGSavtOQ912B4Q.z
 3e2NY4cAulL2RdQgZc4MA6RgYEu8amHYoqX3aUW_hNMfCVfUIvBa1E3drMVAWQ4Li9qOy9wGhYA6
 1Kx0W7UajVzJgpYamtneC8dNgpHAy_D7xMpWNL7kiM50iKz0uxvEzcwyl1ocIbXpZqfjDA1qt4Zf
 67_m7TFTLLZZ6I2NNF63V2fn8usM_6JYoblmy47KmgFruMmEwgphS15xQ56N8Grdm6KxmW17ttFj
 aQP3Jt4AjFZKd9pR.MY4M0QL9inVfXc1mjbWaj8TbqA6wic8a41SLQd_yH0m92TlfcDjfv41VjXD
 K1A8qB6rt4T6YmzqlU8C9g423NP1LZzPijPFS6bMC7Qg2N1YlIFQyVyUxxoxcNjiwxiH2MsC2O_5
 cdX1opuNvHnlem1Wf9lSkDaw8XCEw.phghyzszMEHDDKCvarOBiW83BPGVq4OzFRMD693zXkKuIr
 jHZFiEkquKAC3p_nLYOTX8FDypjqx1nuFTgzofQjyJCg2Zz0vzSSNS6i0szMTQWWwBsncABw5164
 NRrs4y9EvizY6cClcyYeoCmUJi7MsiZQ4lQxIMkCW1rIg48bsm3NjcN9X1uO2HkMefhv88qYl3XD
 QxXDmsnxG4v1XMjIxVVVxlvJBMhg7VTTp5LiuKh8qmzvOmbeYMQhBrz7m.LrlVSXdjczYGUWQ_pf
 MPkI_9VXoUVm6U14ohOCyqDWpTEeenPqZ4TfiaLX99tsQSbaB1L1UqdC2hWmo6xc.WaEAw4iyK_Y
 tOFPI1tZKO5xf808iU.h5eO.ZAA60LtYjB6NHEMMH2OfsG1.psH4IuBjgSTJKuwsa3XDpAMYygj4
 vZp5oFSf1XTAAtdsS597opa7DZyjbv5.sE.fiCG_zmd7F
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Thu, 28 May 2020 10:45:19 +0000
Date: Thu, 28 May 2020 10:43:18 +0000 (UTC)
From: Aileen Billanes <aileenbill03@yahoo.com>
Message-ID: <2133411364.957960.1590662598869@mail.yahoo.com>
Subject: From Mrs.Aileen Billanes
MIME-Version: 1.0
References: <2133411364.957960.1590662598869.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15959 YMailNodin Mozilla/5.0 (Windows NT 6.1;
 ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61
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
Reply-To: billanesaleen93@yahoo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dearest One,

Compliment of the Season,Pardon me for Contacting You Through this media. But please I am in Desperate Need of your assistance: My Name is Mrs.AILEEN BILLANES the wife of Mr.Eleaza Billanes Mayor of Rizal in Yatagan Province. Who Was recently in the Philippine Killed by Gunmen on JUNE 12TH 2018. Well Threat During the late husband on my life , He gave me the total sum of U.S.($8.5USD Eight Million Five Hundred Thousand Us Dollars) this money is deposited with a firm in ABROAD in a metallic box .

Then deposit it in a security and finance company abroad just in case anything ever Happen to him . I did deposit the total sum as He gave it to me under a secret arrangement as a family valuable. This Means That the security company does Not Know the content of this metallic box.Since the death of my late husband , the Philippine state government has blocked me and my late husband accounts Through the help of my late husband family. Also my late husband brothers succeeded in Collecting Have All Our properties from me That is under my control and They Are Still looking for more.Therefore I am Contacting you to help me secure the sum Which I Explain to you above , for the future of my kids.

Since my late husband family made it impossible for me to move out of my late husband in Philippine house Please do tell me if I can trust you as Who Will Not sit on this money When You Claim it. I am willing to Give you 20% of the total sum in box After That You Have successfully secured it. Reasons for safety so That I can come over to meet you there in your country for you to help me invest the money in a good business i will like to hear from you so that i will Immediately know if i can trust you with all my heart and if you are capable so that i Can send you my pictures and my international passport and all the documents so That You Will Better Understand and I will wait your message on my

Best Regards
Mrs.Aileen Billanes
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
