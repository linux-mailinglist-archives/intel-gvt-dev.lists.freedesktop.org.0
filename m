Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39457A2F3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 17:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AFA12B6AB;
	Tue, 19 Jul 2022 15:27:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F78112C0E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658244417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7zzeWeOFiX/qPfQUEc/yUHAFf2sghiN9c5AjnoHblQ=;
 b=LOnT/rrVxVd2+/HOq9FsDd/b+2JwyBOQr1rXDjaoN4rnddzU63H3du4hLRNtVTFwaDeX9K
 08jxh56n4WSoIbQSCIHOkBlEtVCsmM6J7wZ5bRg/KTkBnXEkNabnRrAw3Xja7Je/vPT8Nl
 A3wKPPGXd0uye17HOmHlDxQ4SBpNgqY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-_CbJLwbeOlyhXCMD_Npr7w-1; Tue, 19 Jul 2022 11:26:47 -0400
X-MC-Unique: _CbJLwbeOlyhXCMD_Npr7w-1
Received: by mail-il1-f200.google.com with SMTP id
 e9-20020a056e020b2900b002dc6c27849cso9558280ilu.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 08:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=G7zzeWeOFiX/qPfQUEc/yUHAFf2sghiN9c5AjnoHblQ=;
 b=gd5K/TWPVf7nJMsKEZB9z3CxfOKmAhezB/ffKjF2P5KCHlIWXmMd4SkhWAvOZoEHoZ
 63BOxw22jhPsS+61YAxpIDZzQACM9O37By/7Dk+ZaKfocHaLqyY+ApRdR7F4Xx2kPaQO
 fWKb84mjdIG081Llz4bVc2rzzLkE95dXAYcDxycQQKOa/IdJbWlLdBX6xXDQgQurlEPW
 pdY97ELEHrpI6zKtti+yzBwJT+aSRRM7dvK0e9TIh9hUAdkCP8zknRzOnbv3Q468CMS9
 yC76BDH+Knidc6R6CoMo6vlAIe7GDTVFh7zVkYMPYOihIgGE8GoR3BHsHbD7Ysp8jYOh
 z3ww==
X-Gm-Message-State: AJIora8ZDnzoNxKP4hI08ce81wrmxHtCyymBNHeH1Xzv8mb5AKf/LyX+
 IIgie35Wh2VLJ/m/zTpRw8PSVsxy4/EGZD3XDGO73QVt5cLHpE3SJ7OKtlZM0rofObGxyNxwPBY
 ZM0DK6q7EncNlvKhySL/1IeuYk2gM9U3olA==
X-Received: by 2002:a05:6638:348c:b0:33f:82b2:7441 with SMTP id
 t12-20020a056638348c00b0033f82b27441mr17856991jal.296.1658244406585; 
 Tue, 19 Jul 2022 08:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCP7legSjso0LeShf9Ua6sFhO1nc12IEp69v7ovtogZn2d+6QLUaad2RzcOZuMrXJv8UG/8A==
X-Received: by 2002:a05:6638:348c:b0:33f:82b2:7441 with SMTP id
 t12-20020a056638348c00b0033f82b27441mr17856977jal.296.1658244406330; 
 Tue, 19 Jul 2022 08:26:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t2-20020a92cc42000000b002dcf927087asm1345647ilq.65.2022.07.19.08.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 08:26:45 -0700 (PDT)
Date: Tue, 19 Jul 2022 09:26:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify the mdev interface v6
Message-ID: <20220719092644.3db1ceee.alex.williamson@redhat.com>
In-Reply-To: <20220719144928.GB21431@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
 <20220718153331.18a52e31.alex.williamson@redhat.com>
 <1f945ef0eb6c02079700a6785ca3dd9864096b82.camel@linux.ibm.com>
 <20220719144928.GB21431@lst.de>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022 16:49:28 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Jul 18, 2022 at 10:01:40PM -0400, Eric Farman wrote:
> > I'll get the problem with struct subchannel [1] sorted out in the next
> > couple of days. This series breaks vfio-ccw in its current form (see
> > reply to patch 14), but even with that addressed the placement of all
> > these other mdev structs needs to be handled differently.  
> 
> Alex, any preference if I should just fix the number instances checking
> with either an incremental patch or a resend, or wait for this ccw
> rework?

Since it's the last patch, let's at least just respin that patch rather
than break and fix.  I'd like to make sure Eric is ok to shift around
structures as a follow-up or make a proposal how this series should
change though.  Thanks,

Alex

