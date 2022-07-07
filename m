Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98056AECA
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jul 2022 01:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9511B5C4;
	Thu,  7 Jul 2022 23:01:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5B411B5C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Jul 2022 23:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657234902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1R4YqBu0svZmycrzTEsm+CshT1fviRoeDSNFKgJtmI=;
 b=NtcsMg56U1ZGSM7KaMONk8fsvdyQH4LQztOHCxp6IXdCSJBcRMq5BKBtg5hBDdet8bt4Z7
 SbvrGgyhE5YnamXqnJOKMocy9loifHGZRkLro70l2jLKNwL4eCPBcbMTNw91opZL+hnJfv
 ko8lqKMbZXerFGdqYD/iWrcaXjvzeQA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-stP4N_35PLyjW14vO2RBOA-1; Thu, 07 Jul 2022 19:01:41 -0400
X-MC-Unique: stP4N_35PLyjW14vO2RBOA-1
Received: by mail-io1-f69.google.com with SMTP id
 k19-20020a6b4013000000b00678eb404d59so900743ioa.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 07 Jul 2022 16:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Q1R4YqBu0svZmycrzTEsm+CshT1fviRoeDSNFKgJtmI=;
 b=p3MhUXcSaYnx0dKMEUhdILMd7k9a5FeIOqvWvT0rGdY0Ef4XKmC4ZbE8L+ecjlKuqG
 e5meB22DmbKHmpiWc8AJFjxjF/imwE5aVTJxOlBIfziT42u8pXFU5BdoYqPxtkzA48lr
 ZgUtJrHjoAr/giO91xt8TfnLLgims84OvfEwwZ4+QNnDsuVF5jCYaLIS6H/o2b5n+i59
 h8fpbcGPOOCAetHGXAQaGwFKGwuooc1Ly5qVE6QRmrB9Kr1BGGdQiHw/lPTVJHtgaSzx
 LEQEaS1ltQHPA0uVklYDBykhpUB3hr8hyLIIxOgR1ZmMh1YSGMUeSzmp+Qe8DeBl/Mfj
 pFBg==
X-Gm-Message-State: AJIora/ObmGiNSxWvJY8r6icKOOHftCK/oeX+Jb9OHuoo73zEJyFDdLf
 MPEreYK2OtdSk/JKTCbSrSMxJKtrc9jTL9bLLWbnC8LT+aPJUVJU+92BwGICWVPszmLDVCtBHZ1
 Glj8w6zO0NhFQsdxIjTxbj8UO8loiXh0dNA==
X-Received: by 2002:a92:dc85:0:b0:2d9:1a4e:67b1 with SMTP id
 c5-20020a92dc85000000b002d91a4e67b1mr305991iln.282.1657234900872; 
 Thu, 07 Jul 2022 16:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sipTe8IAMIsf4DdtE688PJxdjqLg8FaCbNUHuN/Z4VXumXyfd4opRxKbH9GUMWrG+goEhcVQ==
X-Received: by 2002:a92:dc85:0:b0:2d9:1a4e:67b1 with SMTP id
 c5-20020a92dc85000000b002d91a4e67b1mr305978iln.282.1657234900651; 
 Thu, 07 Jul 2022 16:01:40 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i15-20020a92c94f000000b002dc21dec1d9sm3635833ilq.16.2022.07.07.16.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 16:01:40 -0700 (PDT)
Date: Thu, 7 Jul 2022 17:01:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/15] vfio/mdev: remove an extra parent kobject reference
Message-ID: <20220707170139.1b2f977e.alex.williamson@redhat.com>
In-Reply-To: <20220707134052.GC19060@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
 <20220706074219.3614-16-hch@lst.de>
 <20220706143833.GD693670@nvidia.com>
 <20220707134052.GC19060@lst.de>
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
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 7 Jul 2022 15:40:52 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Jul 06, 2022 at 11:38:33AM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 06, 2022 at 09:42:19AM +0200, Christoph Hellwig wrote:  
> > > The mdev_type already holds a reference to the parent through
> > > mdev_types_kset, so drop the extra reference.  
> > 
> > I would drop this patch, but at least the explanation needs tweaking..  
> 
> I'm fine with that.  Alex, any preferences?

Modulo the bogus kobject_put()s, this essentially reverts:

commit 9a302449a58d45d0ef2aab686f64b35919bc604c
Author: Jason Gunthorpe <jgg@ziepe.ca>
Date:   Tue Apr 6 16:40:30 2021 -0300

    vfio/mdev: Add missing reference counting to mdev_type
    
    struct mdev_type holds a pointer to the kref'd object struct mdev_parent,
    but doesn't hold the kref. The lifetime of the parent becomes implicit
    because parent_remove_sysfs_files() is supposed to remove all the access
    before the parent can be freed, but this is very hard to reason about.
    
    Make it obviously correct by adding the missing get.
    
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Reviewed-by: Cornelia Huck <cohuck@redhat.com>
    Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
    Message-Id: <7-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
    Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Which we all seemed to think was a good thing 15 months ago.  It is
still difficult to reason when the mdev_type_ktype.release function
occurs relative to the parent reference held by the kset, but without
an explanation how we're safe, I'm ok with a little paranoia and
explicit references.  Thanks,

Alex

