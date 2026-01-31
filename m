Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPMFHDw+fmk6WgIAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 31 Jan 2026 18:39:08 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46CC355B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 31 Jan 2026 18:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02B10E0E5;
	Sat, 31 Jan 2026 17:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=worksmobile.com header.i=@worksmobile.com header.b="tTWjMDAy";
	dkim=pass (1024-bit key; unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="XrijJyIr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Sat, 31 Jan 2026 17:39:04 UTC
Received: from cvsmtppost102.wmail.worksmobile.com
 (cvsmtppost102.wmail.worksmobile.com [125.209.209.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6AD10E0E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 Jan 2026 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
 s=s20171120; t=1769880541;
 bh=iEI17KAqDB/dRhrOZ1PbctJ1J6DC7krD9xi13Cm7BXk=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=tTWjMDAyb2Ge7AH1yWPmjitABEpIDG0rPk1s48TPZ6Lp9qIcwoKIQxuZTaDLtEVdl
 VNcA+ZHS5dgPd8AaP++bUQvW+YAm0W1apeS48mpDQD/9onTrp/+tA36FSza6626CN9
 MLybZ8zGcdMnOkdneae+NdoAoYC/fqYriDmbid4C9qUs3CPhnRXaN1dMfuzDOLz36o
 cdgPGX/uNY5AFJF2wmiHeIxE0WCmw4lqhY6El5khB11wxFTvtbJX1qNxi77muB1OLt
 hVObErOxdiabrNb5s674HfL+ditGYXY+AkuUitcLCbJGc9UDikWA/07xiZpUDUyK2X
 mIMfnUmVBeW8A==
X-Originating-IP: 163.152.163.130
Received: from cvsendbo003.wmail ([10.113.20.165])
 by cvsmtppost102.wmail.worksmobile.com with ESMTP id ExnjErlbQUGQIk-kyQXn4A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 Jan 2026 17:29:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
 s=naverworks; t=1769880541;
 bh=iEI17KAqDB/dRhrOZ1PbctJ1J6DC7krD9xi13Cm7BXk=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=XrijJyIrSRpkCUdkgbgQyQiXiLilO6tyOAGBvkht9hZSODBKrP/Mv7Msct+B6URPX
 lHK6KxMTJE09SLHq+2K8dDbsOnW1Dg9H3qLbI046BJ/+GXhmkngHzlpYZSZgdWsEY9
 oRANi8fxjxXyUvx2ojTqCfMz6wEN2T3/YGxtsJCk=
X-Session-ID: 5wpZsSPVQgS5L5sIxy7SeA
X-Originating-IP: 163.152.163.130
X-Works-Send-Opt: MenXjAJYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: AZbdaAvrFqJZ+HmmFAu/+6E=
Received: from s2lab05.. ([163.152.163.130])
 by jvnsmtp403.gwmail.worksmobile.com with ESMTP id 5wpZsSPVQgS5L5sIxy7SeA
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 17:29:00 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: intel-gvt-dev@lists.freedesktop.org
Cc: zhenyuw.linux@gmail.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [Question] Dead code in intel_gvt_init() for intel_gvt_init_irq()
 error check?
Date: Sun,  1 Feb 2026 02:28:58 +0900
Message-Id: <20260131172858.3370637-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[korea.ac.kr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[worksmobile.com:s=s20171120,korea.ac.kr:s=naverworks];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,intel.com,ursulin.net,korea.ac.kr];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ingyujang25@korea.ac.kr,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[worksmobile.com:+,korea.ac.kr:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,worksmobile.com:dkim,korea.ac.kr:mid,korea.ac.kr:dkim]
X-Rspamd-Queue-Id: ED46CC355B
X-Rspamd-Action: no action

Hi,

I noticed that in drivers/gpu/drm/i915/gvt/kvmgt.c, the function
intel_gvt_init() checks the return value of intel_gvt_init_irq()
(at line 1858):

    ret = intel_gvt_init_irq(gvt);
    if (ret)
        goto out_free_firmware;

However, looking at intel_gvt_init_irq() in
drivers/gpu/drm/i915/gvt/interrupt.c (line 717), the function
always returns 0 and has no error paths.

What's interesting is that the function's documentation comment
(line 714-715) states:
    "Returns:
     Zero on success, negative error code if failed."

This suggests the function was designed to return error codes, but
the current implementation only returns 0. The error check in
intel_gvt_init() is therefore unreachable.

Is this intentional defensive coding for potential future changes,
or should the documentation be updated to reflect that the function
always succeeds? Alternatively, should the function be changed to
void since it never fails?

Thanks,
Ingyu Jang
