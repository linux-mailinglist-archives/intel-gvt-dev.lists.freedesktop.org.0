Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEBB1A04BC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Apr 2020 04:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2696E514;
	Tue,  7 Apr 2020 02:12:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic305-3.consmr.mail.bf2.yahoo.com
 (sonic305-3.consmr.mail.bf2.yahoo.com [74.6.133.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863426E514
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 Apr 2020 02:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1586225534; bh=Fg3WtxlXn8YtjBZp6f+rgadlup5S6Aj1tp9w4U2iII4=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=q4OtFWbyD+2ym7sLsiOhuKPK6TSBh54rhdDRHB/xv3VIEJ3UvlzrdlyjfdVjp0899eQ+82X4RShNWCPNoYi7LFORsEGE3Ey8BDM5QovaFPcY27Tk18xnbSd763e6ae1IyVg2QOxNZ78aAFtOtLXIXzP0Sv753hIUUmi9vY94DuaJRyUgckEoE7XWDDFDcNUGvzgQLbey1Rjs3VO+xk4M6hOrWwiIcpOYJ0vTLd81EPsjRePyPg3wocIspk9N2UXrrbhfGScKHD3+CkicDOTl/vAmHzS7M6/6uJvt5JURNGImUJucDt0qQOYydsMddz7gmlGK5HhcXlWFhyBismjIzg==
X-YMail-OSG: XbxsLywVM1mcl2IfO5cppuySabDtdGGddqvAMiSi6TDo7UYCBxlbcVRBBA9mx6h
 GFmyoFAYzM48oB7w6jDPABO4_M1x_UQNv3.cvopnnN.csH_vRSNeW4GM1sQADMzVusGZnEzpKE.q
 2j4Pi_DefrMF1mUYaGqUt5Q0x_z.jocKo8YgzeILpErNd3jXWd5nWbfTh8WC74.iFlm7jeTHd8V9
 vpTOKVItDRyOukMxT.AjslHDJlnwWDW8U8w0G390uA0XmPunkZuNT1RohsT32bzwxEAwt1XZTET_
 XHVGPeXuV4Uu7WIGLPmsKJKxiIDnklmob9PYAZo9NxU2rqXBEWQBImwbZSO7twfF8Czj_gLnyIkf
 zjrKsoS3x5VbZNpwVWfMimcLTN6oTU_s.hNlY7VwUP4.38S.4l8LMY93uKq9JiaGUw5SPK_Hz8Wz
 xAYCZSGsk4g9FgH8ioVT8Uvk4Kno.jZsXhqUUUNzeisPBuE.qmpEO4lAFaOEZ6JNeFoU3Iy1yIIX
 n.0470lVUbTMvI87l44kklhLPEck0_elU.CFeXLrqA6CGkH7qBnzrJY2T_.__evsn7DtbSQwnfOx
 xHljiEzHgcuOMA_VLJhRnyHVrGQIyAJtod7ntlI6xLto19dHWnsxVfwtYCq1w5z1KGhBBC1qbwq1
 CKqRUxJSP3UVN5b8Hjai6tQ2BIBzD3EMrZmbxN4qNX_VhVLB4ysagGI_VASa_SD_P0Zs6pnqx4BB
 UDoBLyzLjLw3fqr_lqZu7HuARRsByheP6kdPEZoS_s1X5ahFXDSY_GDlzTKrS9BYBnfnQaJ.sCeH
 pXIFq4m97mv9ZYdHl2o9zg7w6OToLbWzhbTXgxBdL.TA0pCVE3MNCltr1NBO_zy4OPOu8chwfFYK
 Yrb2HiVNEgFwoMhxKnuo6aeQ4LwKL9EVOK2bdlgPYO0S1WZSHwupjKLIIQs6FGx9AV5.T1LrhZ6E
 e9Rvi3xg2V4Xi0bVSmaLLAtgOOndk.3QkRISzssWcLt0rNIJtA7mY2ZPT71.iDVH2mdUNnAfxoV_
 4mybAzIYKJ29cSt2j1iALWLxZU0pPHJK9KBVcPs3ZI.lcHAw6_TLj7cx62bTX6.jDgK9ZXwBdHEB
 pZMBAGQg11yTvPUNeI2g418PO6HgRQwJZQHlZywDOxvT.I.C5XnKV11pe5QM3J8sjsVLmY5VSsDO
 NGi4uLjaArt4tDPup1kOTXPouWiumt1QFxCp3igf34b9TZz.uCymEmeWOio.OVmgZJpzDuLUUOay
 pE2mhp95VzsLMrVxeGPNOsLEQQS.8m7UKBSy7YJzOOjhXOnD1KAzT3LBRZH2Zfik4Y0bFaA--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Tue, 7 Apr 2020 02:12:14 +0000
Date: Tue, 7 Apr 2020 02:12:09 +0000 (UTC)
From: "Mrs. Rinehart Maaly Bob" <ghdrrzsfghh@yahoo.com>
Message-ID: <1597594723.1071355.1586225529931@mail.yahoo.com>
Subject: Good Day Dear,
MIME-Version: 1.0
References: <1597594723.1071355.1586225529931.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15620 YMailNodin Mozilla/5.0 (Windows NT 6.1;
 rv:74.0) Gecko/20100101 Firefox/74.0
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
Reply-To: mrsrinehartm719@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Good Day Dearest,

I am Mrs. Rinehart M. Bob from Australia. It is understandable that you may be a bit apprehensive because you do not know me; I found your email address from a Human resources data base and decided to contact you. I would love to employ you into my charity work; I am ready to donate some money to you to carry on the Charity work in your country. Please reply so that I will give you further details and tell you about myself via email: mrsrinehartm719@gmail.com
 
Thanks and God bless you,
Mrs. Rinehart M. Bob.
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
