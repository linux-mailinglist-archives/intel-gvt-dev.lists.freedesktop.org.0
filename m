Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328C57EA93
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 23 Jul 2022 02:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4D714A26C;
	Sat, 23 Jul 2022 00:18:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762A12B4C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 23 Jul 2022 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658535485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEphr6ZIYFwSwZ4pYciMnV/Wf4dcsbYqo+HwMi5Di7E=;
 b=BMkb+MowpcA9AWBflrm3MortzhGqbtxIi9MmHxXMSCiP4Bks5nBKs8E/UY31xj0kemj3na
 fCwXABq4qIEWmPx12R1YyhqJJTlfioEit+ehzB9vgZ9nu+jbeoT7zPlXB+pHVSg32m/BeL
 LswSvtbZs2QTAWY0LOoGm2AOnIBmcYQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-vXWMRR85NZGcN_oW6rLlRQ-1; Fri, 22 Jul 2022 20:18:04 -0400
X-MC-Unique: vXWMRR85NZGcN_oW6rLlRQ-1
Received: by mail-il1-f198.google.com with SMTP id
 h30-20020a056e021d9e00b002dd1fb66384so1529112ila.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Jul 2022 17:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=iEphr6ZIYFwSwZ4pYciMnV/Wf4dcsbYqo+HwMi5Di7E=;
 b=z+0yg4asbkYIIriAF1Fnr8ysPknb5Ys+NH124WRybOU0n2TgGx2qkJ8mV+ozX15Ork
 X5pdaw6lhD3gPRkUD6DZHd8/Uzsbovd42PP+NdCHD7lFKX49+P3CANMqLpBXvHIijRW0
 Obo7c7IIs7Hz5g0OHRdZM/yxLeSAQ0xSwRHewXlggaKXjQOETZySfkfwlfMIP+Ya/XPD
 6KCna3Kumh6bP2tYPZQameOCF9XKj4sk4geaPqknU13ZXEoGTqH+VErVQsrw6WPOJZoQ
 wmaHItIfPLeZVstZWUC3E31vZUY0hc+rTiTDX++8FSc9ygP2GHwaqRb8MHwK1yvHUCPS
 lJ9g==
X-Gm-Message-State: AJIora9gLf2waMAe+ULkky8ucQ3hYd5Pf9u9W7G8d6Ug56CaujrL2p6C
 B5FOSPTatqgeoPE1O6IN9CmpWYicQ4hxb4luiAy0EwwxOht3e/n8GgsHS25D1ok3BAjkKEouXl1
 Klm8zf9hEtf3W0dMtmp39nmLz80P2qhp/fw==
X-Received: by 2002:a05:6638:160c:b0:33f:54c7:ee69 with SMTP id
 x12-20020a056638160c00b0033f54c7ee69mr1050250jas.65.1658535483693; 
 Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vh5y3jozCZ7iRDuGEDUiaJjAA10VNoYNXKY4pR3tY8wyP5ioYAHZdpqHyeNFeMGRhrxZbgZA==
X-Received: by 2002:a05:6638:160c:b0:33f:54c7:ee69 with SMTP id
 x12-20020a056638160c00b0033f54c7ee69mr1050243jas.65.1658535483492; 
 Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056602340400b00674f9fb1531sm2752495ioz.30.2022.07.22.17.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
Date: Fri, 22 Jul 2022 18:18:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <20220722181800.56093444.alex.williamson@redhat.com>
In-Reply-To: <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220722161129.21059262.alex.williamson@redhat.com>
 <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 joonas.lahtinen@linux.intel.com, kevin.tian@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kwankhede@nvidia.com, terrence.xu@intel.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, jani.nikula@linux.intel.com,
 freude@linux.ibm.com, zhenyuw@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 tvrtko.ursulin@linux.intel.com, cohuck@redhat.com, oberpar@linux.ibm.com,
 svens@linux.ibm.com, daniel@ffwll.ch
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 16:12:19 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Fri, Jul 22, 2022 at 04:11:29PM -0600, Alex Williamson wrote:
> 
> > GVT-g explodes for me with this series on my Broadwell test system,
> > continuously spewing the following:  
> 
> Thank you for running additional tests.
> 
> > [   47.348778] WARNING: CPU: 3 PID: 501 at drivers/vfio/vfio_iommu_type1.c:978 vfio_iommu_type1_unpin_pages+0x7b/0x100 [vfio_iommu_type1]  
>  
> > Line 978 is the WARN_ON(i != npage) line.  For the cases where we don't
> > find a matching vfio_dma, I'm seeing addresses that look maybe like
> > we're shifting  a value that's already an iova by PAGE_SHIFT somewhere.  
> 
> Hmm..I don't understand the PAGE_SHIFT part. Do you mind clarifying?

The iova was a very large address for a 4GB VM with a lot of zeros on
the low order bits, ex. 0x162459000000.  Thanks,

Alex
 
> And GVT code initiated an unpin request from gvt_unpin_guest_pag()
> that is currently unpinning one page at a time on a contiguous IOVA
> range, prior to this series. After this series, it leaves the per-
> page routine to the internal loop of vfio_iommu_type1_unpin_pages(),
> which is supposed to do the same.
> 
> So, either resulted from the npage input being wrong or some other
> factor weighed in that invoked a vfio_remove_dma on those iovas?
> 
> Thanks
> Nic
> 

