Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B4469396
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  6 Dec 2021 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4D07A487;
	Mon,  6 Dec 2021 10:20:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic308-21.consmr.mail.sg3.yahoo.com
 (sonic308-21.consmr.mail.sg3.yahoo.com [106.10.241.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8172C4E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  5 Dec 2021 03:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1638675404; bh=v3kmCDF4uC+e2GUrhMqm80p0VgEmWDCOMg3f62x+O/8=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=FRM8SKn54s8Meio5Cr6SODr9/XizhRq7O4gh4o/6uiXNLAhh/w0qmRJqBhenYLX/HAW35qJjktXVKCdfqagYVaealBuvbfjX7gD8mIqj1npOmBd1NQcmKTEY/fHdZASYmW89CCUTkW8r+NvkABYlmFKn0oac3NHn1kj1QyE7dwuFh1ILJIn4I4px+VBD/8m/fri6k966bkXyWU+pXAAlLwX9p2viLvx2HbyItnaqzovXMMVwSSlSy3VF3jeY/3cQ03oF9RrPYBqHUT08ILH+A0i8MU2UXSG/9tieA2XN/QcG7lGfEEzB3Rsk3KN8LkraB5FiwQV5ursvnE3qMJhWFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1638675404; bh=R52sgQR2/H0+iL8jTluTJkfsSh/tNon7EZE1FwYGJuC=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=ixLEeudYOuZz4BpAsCCL13IGDvJEgTRLmxbM1X4IWvmp9xPfrvqzAbK7gN1NSJPXpV7H+IuvgDxPvlBHwlt138mqMKOqzIro9xwATEPrb3MD8vsO0kx72BVVr81tA9C7l1YqagHDJicKxNFLgkbDm3IfScwYTV9wWQHSNIlDdcDcQTJjSChbY69lFBn2jjERaDIORAysUo/oBi9QwQERlDjeoNcaob7aR2gAqjQnahKYc8R41TgxSrWRjUnggVnKCupRgZ5T5KERn0HoWTMV92qyGYcWObSiKLfLe+x0jFpNtML7bKQfakj/ne6g9UQ+hA3oIB2uzAT0NLyNQyUhgg==
X-YMail-OSG: f9SOGQEVM1mQOSAXacSqsGI76WETX2jGvqadHc.b6gIs_kUW2kzZmxHyX6gYxLv
 rqaFVb6gqf7ep5ZmMVDs2A6oCCDhve.pTIRsB7D4BgEo7tGUYlaGTrhfgEr35xJRRu_ggTg46qeI
 _zKwsJJk.lxpykmpmAm6LEE6tG9kjSXQiH8u7l2i7BTCuS95IkPqQDI3lZRoyoBmw1bQ3AQDuzkT
 91gtkoGRqXLsrEn13BucnKzuusMcRGwUdRpDBj2e87bz9aOHTYxO4RhgkAhSre9NNVpuXsM7EWTR
 fwcUR6j.Brj6OgCib.wwrcjDDrO9Brw5dgskpHbOY0GjG_R981ORKRXedjRhOnCgwM6Oe_C8QUaj
 OVBkk1RO6xGYArTIlocBePvHxwkI_vvdfLGs2bQvq2oIS0XCbj7vAv.HXP_9rbTfkQQfMS0SeYU9
 oOE5sidTutBO4TIv9sOf15_xv1PqE1VR.E.fimVMOzJFjkSMtcmy8ioQ8zxOFQaPRLmPc3gYPNgf
 vUKvEBovRwBsqIoNcSYjr7U_Dsmq.lJ92iMJhZ.tqF57dIE4f0qdhGTo4F859K_YrAa0KKuWZP_X
 7IPkzXX.DD3en9k.KYiH_UwUYJIqwt8DavhKFqabEkFa0NSFAckiSKMVXtOZ7ZgFn2tzFaCRvlhM
 WhinM68EAAGX8v_N4nX8njFTOc0EdqStRvndn_Gjn4zQ0iswSiLTOxZJDfQapsiPJepwwmuravI8
 DQU4vf3SjXjMItuIjxjYprUUWhCRc6fnm1NC8zQDqStKNEF3sw6maq5rXLCkYUJ24UCE_7WI_RSB
 7cR74VrSJXFNcpFN4kWNMVxw2n717dAVVrEQiYaMFJiWDTxhapI3raDy0DZyYBK.rgP2A5GGzNMP
 Ve7urJAkkApiFwd1fxnTaiYsZXNPYnpS1avgkYYM8B6yaOZu1kbUzrjCN849SwZlZzjEp11BbLMK
 aD4jCgt7FuUZK9a13okbamSMc8NzAHtQ2SYWeULB6.QtP7FCPoDB_HQ95g_Fzy8_tsa9OB1_HfQK
 J6p0Lon4NjP7OKKezqS4v7W_xpKigTaFlx1ZDyhS3JqHhXzs.KVuhE.iLTr7oIDgCdZqbBBN7z8o
 3DEYmb6NXoynPzxndZ.0Mg63IGg7YaW7O32Qc7lw3tLJS7_cusBpWt_Shu0uJQ6e1OHq6rGg4E.E
 Juwbm1Htb3wL1TYEMb2w3twFYOQonqflSToStsytbotSvbdH13AxEXp2i7emKKi.Dk9ZOQpL2g5K
 i3r2sAuwKl9YP17fpKadMT49A1QK84dyy.0c4YVvrTE3jkJmjBPtE7beLmy9WcKjNI3n1BumRWX9
 HwHmDz6qPhl2oVDkb5oIf3V0ha6DtErI8D7udAAqA9i.0U22dq8UUxrclDZ_uxWIrC9BigwzxRyB
 __bFN1_W6xLH1bBXMbUeMBSjvRdpFCVXWrNucvsIdCWQAM2d1TfVumtkQhtTUNQtNMESFR9MElvR
 MGFjfP9C9yDCYF3.PvnmXTVP3g7ZTLdHHZ8xtPSHeKCaBNUkkq_7HDyql5IVGqePyKY4n3xB0mXm
 Qt6uAdMH0gVpBglN5h2hBDeLKOltjwcFzbzJJx2Xxeg2AzanWeP6JG5ubs8CrPAmc2WB.60AJVel
 PiWjIBlyFSml3rYRiuc6FefptHdurhC457APC_g4VG7N06_n6pPgkBbi5olbeCtmfY.2Cy.2ACKH
 7iuq01JZxksQbt4R23HBDgaOYJGtpzVwphcTZ4.5sK1_BrZIVx9SGQP6HEjlcTSMLHeWkFsWxM6p
 s6sqLEy1aQixFjHnoqOA2pKf1ucRPeEcQilNo4Xq0So.IGc.m.iLs35aNkMx6iejuIrRCoAeFUCk
 9ZuaiE9Zj_objA7_y0sv31N3AFMilF0lCSAKE.c9QKeXxurt2hg2vBrNEGRNnq.TWzMTOWKZrlNk
 o54lb3euod986Hsc4Pna.Dhh7QzWRgtyQM2_wJT54QWd6cF4opThn1rdm4s82oCP1tGVoUXU2Dhc
 Do8wYRtFo77Fux_446GrOuWcvHHCssy4037PdJ8u18FaU.Jqb.P2Dd0j9awZ5IwtcpC8kOVd_XAu
 FTBwjwwgHD9GlfkXusqyDdogH6gRLkZteWFnIytjZ5sKveFwKWWpj_mVOLXQY
X-Sonic-MF: <good25_news@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.sg3.yahoo.com with HTTP; Sun, 5 Dec 2021 03:36:44 +0000
Date: Sun, 5 Dec 2021 03:36:40 +0000 (UTC)
From: good25 NEWS <good25_news@yahoo.com>
To: "britishhighcommi111@gmail.com" <britishhighcommi111@gmail.com>
Message-ID: <1771558146.784835.1638675400383@mail.yahoo.com>
Subject: Fw: G
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_784834_229692268.1638675400383"
References: <1771558146.784835.1638675400383.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19306 YMailNorrin
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

------=_Part_784834_229692268.1638675400383
Content-Type: multipart/alternative; 
	boundary="----=_Part_784833_682258375.1638675400350"

------=_Part_784833_682258375.1638675400350
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

IArCoA==
------=_Part_784833_682258375.1638675400350
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="ydp714b5541yahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div></div>
        <div><br></div><div>&nbsp;</div></div></body></html>
------=_Part_784833_682258375.1638675400350--

------=_Part_784834_229692268.1638675400383
Content-Type: text/plain
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="f-.txt"
Content-ID: <d8b9dbf6-c267-0366-6050-6ae367f4d216@yahoo.com>

Y1NDQU1NRUQgVklDVElNUyAkNzUwLDAwMFVTRCBET0xMQVJTIEJFTkVGSUNJQVJZLiAgIGJyaXRp
c2hoaWdoY29tbWkxMTFAZ21haWwuY29tDQpSRUYvUEFZTUVOVFMgQ09ERTogRUNJTkJELyAkNzUw
LDAwMFVTRCBET0xMQVJTLk5FVyBERUxISSCWSU5ESUEgU0NBTU1FRCBWSUNUSU1TIENPTVBFTlNB
VElPTiBPRiAkNzUwLDAwMCBVU0QuDQpBVFRFTlRJT04gQkVORUZJQ0lBUlkNClRoZSBCcml0aXNo
IEhpZ2ggQ29tbWlzc2lvbiBpbiBJbmRpYSBpcyB0aGUgcmVwcmVzZW50YXRpdmUgb2YgdGhlIEhl
YWQgb2YgU3RhdGUgb2YgdGhlIFVuaXRlZCBLaW5nZG9tLiBJdCBpcyBsb2NhdGVkIGF0IE5ldyBE
ZWxoaS4gVGhlIEJyaXRpc2ggSGlnaCBDb21taXNzaW9uIGluIE5ldyBEZWxoaSBjb3ZlcnMgY29u
c3VsYXIgc2VydmljZXMgZm9yIE5vcnRoZXJuIEluZGlhLCBuYW1lbHksIERlbGhpIGFuZCB0aGUg
c3RhdGVzIG9mIEphbW11IGFuZCBLYXNobWlyLCBIYXJ5YW5hLCBQdW5qYWIsIFV0dGFyIFByYWRl
c2gsIEhpbWFjaGFsIFByYWRlc2gsIFJhamFzdGhhbiwgYW5kIFV0dGFyYW5jaGFsLiBPbiBiZWhh
bGYgb2YgdGhlIEJyaXRpc2ggSGlnaCBDb21taXNzaW9uIGFuZCB0aGUgTWV0cm8gQmFuayBPZiBV
bml0ZWQgS2luZ2RvbSwgd2Ugd2lzaCB0byBub3RpZnkgeW91IGFzIGEgYmVuZWZpY2lhcnkgb2Yg
JDc1MCwwMDBVU0QgKFNldmVuIEh1bmRyZWQgQW5kIEZpZnR5IFRob3VzYW5kIERvbGxhcnMpIGlu
IGNvbXBlbnNhdGlvbiBvZiBpbnRlcm5ldCBzY2FtLg0KV2UgYXJlIGRlbGVnYXRlZCBmcm9tIHRo
ZSBCcml0aXNoIEhpZ2ggQ29tbWlzc2lvbiBpbiBOZXcgRGVsaGkgSW5kaWEsIGFuZCB0aGUgTWV0
cm8gQmFuayBVSyB0byBwYXkgMTUwIHZpY3RpbXMgb2YgaW50ZXJuZXQgYW5kIHZhcmlvdXMgc2Nh
bXMgJDc1MCwwMDBVU0QgZWFjaCB5b3VyIEUtbWFpbCBpZCB3YXMgbGlzdGVkIGFuZCBhcHByb3Zl
ZCBmb3IgdGhpcyBwYXltZW50IGFzIG9uZSBvZiB0aGUgc2NhbSB2aWN0aW1zLiBBY2NvcmRpbmcg
dG8gdGhlIGxhc3QgbWVldGluZyBoZWxkIG92ZXIgaGVyZSBpbiB0aGUgQnJpdGlzaCBIaWdoIENv
bW1pc3Npb24sIGl0IHdhcyBicm91Z2h0IHRvIG91ciBub3RpY2Ugb2YgdGhlIHZhcmlvdXMgdHlw
ZSBvZiBzY2FtIHdoaWNoIGhhcyBiZWVuIGdvaW5nIG9uIGluIG91ciB3b3JsZCB0b2RheSwgbWFu
eSBwZW9wbGUgaGF2ZSBhbGwgbG9zdCB0aGVpciBwcm9wZXJ0aWVzIGFuZCBzbyBtYW55IG9mIHRo
ZW0gaGF2ZSBldmVuIGdvbmUgaW50byBiYW5rcnVwdGN5IGJlY2F1c2Ugb2YgdGhpcyBob29kbHVt
cy4NClBsZWFzZSB5b3UgYXJlIGhlcmVieSBhZHZpc2VkIHRvIGZpbGwgdGhlIGFwcHJvcHJpYXRl
IGZvcm0gYmVsb3cgZm9yIHRoZSByZWxlYXNlIG9mIHlvdXIgY29tcGVuc2F0aW9uIGZ1bmQgaW1t
ZWRpYXRlbHkuDQoxLkZVTEwgTkFNRVM6CQ0KMi5DT05UQUNUIEFERFJFU1MJDQozLk1PQklMRSBO
VU1CRVI6CQ0KNC5TRVgvQUdFOgkNCjUuQ09VTlRSWToJDQo2Lk9DQ1VQQVRJT046CQ0KNy5NQVJJ
VEFMIFNUQVRVUzoJDQo4LklEIFBST09GIE9SIFBBU1NQT1JUOg0KOS5BTk5VQUwgSU5DT01FOg0K
MTAuSE9XIERPIFlPVSBGRUVMIEFCT1VUIFRISVM/DQoxMSBNQUtFIFNVUkUgWU9VIFNFTkQgWU9V
UiBSRVBMWSBUTyBUSElTIEUtTUFJTDsgICBicml0aXNoaGlnaGNvbW1pMTExQGdtYWlsLmNvbQ0K
WW91IGFyZSB0byBpbW1lZGlhdGVseSBwcm92aWRlIHdpdGggdXMgKEJyaXRpc2ggSGlnaCBDb21t
aXNzaW9uKSB5b3VyIGZ1bGwgZGV0YWlscyBpbiB0aGUgZm9ybSBhYm92ZTsgdG8gZW5hYmxlIHVz
IGZhY2lsaXRhdGVzIHRoZSByZWxlYXNlIG9mIHlvdXIgY29tcGVuc2F0aW9uIGZ1bmQgdG8geW91
IGltbWVkaWF0ZWx5IHdpdGhvdXQgZGVsYXkgb3Igd2hhdCBzbyBldmVyLiBZb3UgYXJlIG5vdCB0
byBkdXBsaWNhdGUgb3IgY29tbXVuaWNhdGUgd2l0aCBhbnkgb25lIGFib3V0IHRoaXM7IHdlIGFy
ZSBpbiB0cmFjZSBvZiB0aGVzZSBob29kbHVtcy4NCllvdXJzIFRydWx5IEZyYW5jZXMgSG9vcGVy
DQpCcml0aXNoIEhpZ2ggQ29tbWlzc2lvbiBOZXcgRGVsaGk=

------=_Part_784834_229692268.1638675400383--
